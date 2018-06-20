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
    average = Activity.where(possibility_id: self.id, user_id: user_id).average("rating")

    if average != nil
      puts "Your average rating for this possibility, on a scale of 1-5, is: " + Rainbow("#{average}").bright
    end

  end
end
