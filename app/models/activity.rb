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
  def self.get_non_exclude_possiblity(user_id, time)

      #serch create an array of all possiblites that do not have
    exclude_poss_array = Activity.where(user_id: user_id, exclude: true)

    exclude_poss_ids = exclude_poss_array.map {|x| x.possibility_id}.uniq

    poss_array = Possibility.all.map{|poss_object| poss_object if !exclude_poss_ids.include?(poss_object.id)}.compact

    if poss_array.length == 1
      puts "We have no more possibilities for you."
      exit
    end

    poss_array.select do |possibility|
      possibility.duration_in_minutes == time || possibility.duration_in_minutes == nil
    end.sample
  end




end
