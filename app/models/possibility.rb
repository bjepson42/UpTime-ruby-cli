class Possibility < ActiveRecord::Base
  has_many :activities
  has_many :users, through: :activities

  #----Select Possibility by location

  def self.work_possibilities
    Possibility.all.select do |possibility|
      possibility.necessary_location == "work" || possibility.necessary_location == nil
    end
  end

  def self.home_possibilities
    Possibility.all.select do |possibility|
      possibility.necessary_location == "home" || possibility.necessary_location == nil
    end
  end

  def possibility_stats(user_id)
    average_rating = Activity.where(possibility_id: self.id, user_id: user_id).average("rating")


    accepted = Activity.where(possibility_id: self.id, user_id: user_id, status: "accepted" || "accepted and completed" || "accepted but not completed").count

    rejected = Activity.where(possibility_id: self.id, user_id: user_id, status: "rejected").count

    acceptance_percentage = ((accepted.to_f / (accepted.to_f + rejected.to_f)) * 100).to_i



    if accepted < 50
      puts "---Your acceptance percentage for this possibility is: " + Rainbow("#{acceptance_percentage}%").bright + ". Perhaps you should think twice about rejecting this possibility again."
    end

    if accepted > 50 && accepted < 75
      puts "---Your acceptance percentage for this possibility is: " + Rainbow("#{acceptance_percentage}%").bright + ". Not bad! Keep it up!"
    end

    if accepted > 75
      puts "---Your acceptance percentage for this possibility is: " + Rainbow("#{acceptance_percentage}%").bright + ". That's awesome! Keep it up!"
    end

    puts ""

    if average_rating != nil
      puts "---Your average rating for this possibility, on a scale of 1-5, is: " + Rainbow("#{average_rating.round(2)}").bright
    end
  end

end
