class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :possibility

#-------Set activity rating

  def rate(user_response)
    user_response= user_response.to_i
    user_response = 5 if user_response > 5
    user_response = 1 if user_response < 1
    self.rating = user_response
    self.save
  end

#----get possiblity and check against exclude list

#-----returns true if possiblity has been excluded by user ever
  def self.get_non_exclude_possiblity(user_id, time, limit_place)


      #serch create an array of all possiblites that do not have
    exclude_poss_array = Activity.where(user_id: user_id, exclude: true)

    exclude_poss_ids = exclude_poss_array.map {|x| x.possibility_id}.uniq

    if limit_place == "work"
      location_time_exclude = Possibility.all.select do |possibility|
        possibility.duration_in_minutes == time && ["work", nil].include?(possibility.necessary_location) || possibility.duration_in_minutes == nil && ["work", nil].include?(possibility.necessary_location)
      end
    elsif limit_place == "home"
      location_time_exclude = Possibility.all.select do |possibility|
        possibility.duration_in_minutes == time && ["home", nil, "not work"].include?(possibility.necessary_location) || possibility.duration_in_minutes == nil && ["home", nil, "not work"].include?(possibility.necessary_location)
      end
    elsif limit_place == "not work or home"
      location_time_exclude = Possibility.all.select do |possibility|
        possibility.duration_in_minutes == time && [nil, "not work"].include?(possibility.necessary_location) || possibility.duration_in_minutes == nil && [nil, "not work"].include?(possibility.necessary_location)
      end
    end

    poss_array = location_time_exclude.map{|poss_object| poss_object if !exclude_poss_ids.include?(poss_object.id)}.compact

    if poss_array.length == 0
      puts ""
      puts "You have deleted all possibilities associated with the time and location constraints you previously entered. If this was unintentional, you can always start fresh by reseeding the database. Exit UPTIME by typing "/quit/". Then type "rake db:migrate/" and press enter. Then type "/rake db:migrate/" and press enter. Finally, type "rake db:seed" and press enter. At this point, you should be ready to go! ."
      exit
    end
    poss_array.sample
  end

  def activity_stats
    average_rating = Activity.where(possibility_id: self.possibility_id, user_id: self.user_id).average("rating")

    if average_rating!= nil
      puts "Your average rating for this activity, on a scale of 1-5, is: " + Rainbow("#{average_rating.round(2)}").bright
    end

  end





end
