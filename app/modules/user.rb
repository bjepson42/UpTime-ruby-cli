class User < ActiveRecord::Base
  has_many :activities
  has_many :possibilities, through: :activities

end
