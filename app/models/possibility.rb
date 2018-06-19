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



end
