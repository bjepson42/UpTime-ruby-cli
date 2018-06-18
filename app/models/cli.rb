require 'pry'
class Cli
  attr_accessor :user, :possibility, :user_time, :accepted_or_rejected
  def call
     self.start
  end
#---get user object associated with current users
  def start
    puts "Please give us your first and last name"
    user_name_response = gets.chomp
    user_name_array = user_name_response.split(" ")
    self.user = User.find_by(first_name: user_name_array[0], last_name: user_name_array[1])
    puts "Hi #{self.user.first_name}!"
    self.how_much_time?
  end




#---get time constraint
  def how_much_time?
    #how much time do you have 1. 15min, 2. 30 min, 3. 60 minutes
    puts "How much time do you have?"
    puts "1. 15 minutes"
    puts "2. 30 minutes"
    puts "3. 60 minutes"
    puts "Please enter a number."
    self.user_time = gets.strip
    if user_time == "exit"
      exit
    end
    self.suggest_possibility
  end

  def suggest_possibility
    case self.user_time
    when "1"
      self.possibility = self.user.suggest_random_possibility(15)
      puts self.possibility.name
      puts self.possibility.description
      self.accept_or_reject
    when "2"
      self.possibility =  self.user.suggest_random_possibility(30)
      puts self.possibility.name
      puts self.possibility.description
      self.accept_or_reject
    when "3"
      self.possibility = self.user.suggest_random_possibility(60)
      puts self.possibility.name
      puts self.possibility.description
      self.accept_or_reject
    else
      self.how_much_time?
    end
  end


#------Accept or reject, save as Activity regardless

  def accept_or_reject
    puts "Would you like to accept or reject this possibility?"
    puts "1. Accept this possibility"
    puts "2. Reject this possibility. Suggest another."
    self.accepted_or_rejected = gets.strip
    self.create_activity
  end

#------after accept don't autoquit ask if they want another activity or to quit

  def create_activity

    if self.accepted_or_rejected == "1"
      activity = Activity.create(status: "accepted", name: self.possibility.name, description: self.possibility.description, physical_intensity: self.possibility.physical_intensity, mental_intensity: self.possibility.mental_intensity, fun_index: self.possibility.fun_index, duration_in_minutes: self.possibility.duration_in_minutes, necessary_location: self.possibility.necessary_location, user_id: self.user.id, possibility_id: self.possibility.id)
      
    elsif self.accepted_or_rejected == "2"
      activity = Activity.create(status: "rejected", name: self.possibility.name, description: self.possibility.description, physical_intensity: self.possibility.physical_intensity, mental_intensity: self.possibility.mental_intensity, fun_index: self.possibility.fun_index, duration_in_minutes: self.possibility.duration_in_minutes, necessary_location: self.possibility.necessary_location, user_id: self.user.id, possibility_id: self.possibility.id)

      puts "Suggesting another possibility..."
      self.suggest_possibility

    end



  end

end
