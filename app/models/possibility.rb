class Possibility < ActiveRecord::Base
  has_many :activities
  has_many :users, through: :activities

  def self.suggest_random_possibility
  

  end

end
