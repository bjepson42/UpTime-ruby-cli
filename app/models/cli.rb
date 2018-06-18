require 'pry'
class Cli
  attr_accessor :user
  def call
     self.start
  end

  def start
    puts "Please give us your first and last name"
    user_name_response = gets.chomp
    user_name_array = user_name_response.split(" ")
    self.user = User.find_by(first_name: user_name_array[0], last_name: user_name_array[1])
    puts "Hello, #{self.user.first_name} #{self.user.last_name}!"
    self.how_much_time?
  end





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
    
  end

end
