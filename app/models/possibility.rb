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

    accepted = Activity.where(possibility_id: self.id, user_id: user_id, status: "accepted").count + Activity.where(possibility_id: self.id, user_id: user_id, status: "accepted and completed").count + Activity.where(possibility_id: self.id, user_id: user_id, status: "accepted but not completed").count

    rejected = Activity.where(possibility_id: self.id, user_id: user_id, status: "rejected").count

    acceptance_percentage = ((accepted.to_f / (accepted.to_f + rejected.to_f)) * 100)

    if accepted == 0 and rejected == 0
      puts "This is the first time we have suggested this possibility to you."
    elsif acceptance_percentage >= 0 && acceptance_percentage < 50
      puts "---Your acceptance percentage for this possibility is: " + Rainbow("#{acceptance_percentage.to_i}%").bright + ". Perhaps you should think twice about rejecting this possibility again."
    elsif acceptance_percentage >= 50 && acceptance_percentage < 75
      puts "---Your acceptance percentage for this possibility is: " + Rainbow("#{acceptance_percentage.to_i}%").bright + ". Not bad! Accept it now and watch it rise!"
    elsif acceptance_percentage >= 75
      puts "---Your acceptance percentage for this possibility is: " + Rainbow("#{acceptance_percentage.to_i}%").bright + ". That's awesome! Keep it up!"
    end

    puts ""

    if average_rating != nil
      puts "---Your average rating for this possibility, on a scale of 1-5, is: " + Rainbow("#{average_rating.round(2)}").bright
    end
  end

  def self.user_possibility_stats(user_id)
    accepted = Activity.where(user_id: user_id, status: "accepted").count + Activity.where(user_id: user_id, status: "accepted and completed").count + Activity.where(user_id: user_id, status: "accepted but not completed").count

    rejected = Activity.where(user_id: user_id, status: "rejected").count

    acceptance_percentage = ((accepted.to_f / (accepted.to_f + rejected.to_f)) * 100)

    if accepted == 0 and rejected == 0
      puts "Once you have used UPTIME, we'll use this space to display some statistics about how often you accept and reject our suggestions."
    elsif acceptance_percentage >= 0 && acceptance_percentage < 50
      puts "You have accepted " + Rainbow("#{acceptance_percentage.to_i}%").bright + " of the possibilities we have suggested to you so far. Do you best to accept our suggestions today, and watch that percentage rise!"
    elsif acceptance_percentage >= 50 && acceptance_percentage < 75
      puts "You have accepted: " + Rainbow("#{acceptance_percentage.to_i}%").bright + " of the possibilities we have suggested to you so far. Nice! Keep it up!"
    elsif acceptance_percentage >= 75
      puts "You have accepted " + Rainbow("#{acceptance_percentage.to_i}%").bright + " of the possibilities we have suggested to you so far. You are killin' it!"
    end




  end

end
