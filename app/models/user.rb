class User < ActiveRecord::Base
  has_many :activities
  has_many :possibilities, through: :activities

  def suggest_random_possibility
    #call method of same name from Possibility class

  end



  def create_and_save_activity(user_response)
    #two options: accept or reject, change status appropriately
    #if rejected, call method again

  end

end
