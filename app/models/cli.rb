require 'pry'
class Cli
  attr_accessor :user, :possibility
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
    user_time = gets.strip
    if user_time == "exit"
      exit
    end
    #<----pull this out and make a helper method so we can call it if rejected
    case user_time
    when "1"
      self.possibility = self.user.suggest_random_possibility(15)
    when "2"
      self.possibility =  self.user.suggest_random_possibility(30)
    when "3"
      self.possibility = self.user.suggest_random_possibility(60)
    else
      puts "Please enter a number."
    end
  end

#------Accept or reject, save as Activity regardless

#------after accept don't autoquit ask if they want another activity or to quit 

end
