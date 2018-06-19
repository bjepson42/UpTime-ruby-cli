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





end
