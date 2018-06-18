class User < ActiveRecord::Base
  has_many :activities
  has_many :possibilities, through: :activities

  def suggest_random_possibility

  end



  def create_and_save_activity

  end

end
