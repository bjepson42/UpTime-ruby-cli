class User < ActiveRecord::Base
  has_many :activities
  has_many :possibilities, through: :activities

  def suggest_random_possibility(duration_in_minutes:)
    Possibility.all.select do |possibility|
      possibility.duration_in_minutes == duration_in_minutes || possibility.duration_in_minutes == nil
    end.sample
  end



  def create_and_save_activity(user_response)
    #two options: accept or reject, change status appropriately
    #if rejected, call method again

  end

end
