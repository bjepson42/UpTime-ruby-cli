class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :possibility

#-------Set activity rating

  def activity_rating(user_response)
    self.rating = user_response.to_i
  end 





end
