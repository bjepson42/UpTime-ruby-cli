require 'pry'
class Cli
  attr_accessor :user, :possibility, :user_time, :accepted_or_rejected, :activity, :completed_activity, :suggest_another, :activity

  def call
     self.start
  end
#---get user object associated with current users
  def start
    puts ""
    puts ""
    puts "Welcome to UPTIME!"
    puts ""
    puts "Have you used UPTIME on this computer before?"
    puts ""
    puts "1. Yes"
    puts "2. No"
    used_before = gets.strip
    if used_before == "1"
      self.user_already_exists
    elsif used_before == "2"
      self.create_new_user
    end

  end


  def user_already_exists
    puts ""
    puts ""
    puts "Please type your name (first and last)."
    puts ""
    puts ""
    user_name_response = gets.chomp
    user_name_array = user_name_response.split(" ")
    self.user = User.find_by(first_name: user_name_array[0], last_name: user_name_array[1])
    if self.user == nil
      self.user = User.find_by(nick_name: user_name_array[0], last_name: user_name_array[1])
    end
    if self.user
      if self.user.nick_name
        puts ""
        puts ""
        puts "Hi, #{self.user.nick_name}! We've found you in our records. Welcome to UPTIME!"
        puts ""
        puts ""
      else
        puts ""
        puts ""
        puts "Hi, #{self.user.first_name}! We've found you in our records. Welcome to UPTIME!"
        puts ""
        puts ""
      end
      puts "You're here, because you have a bit of downtime, and you want to turn it into UPTIME!"
      puts ""
      puts ""
      self.how_much_time?
    else
      puts ""
      puts ""
      puts "We could not find you in our records. Are you sure you've used UPTIME on this computer before?"
      puts ""
      puts "1. Yes. Perhaps I mispelled my name. I'll try again."
      puts "2. No. I better tell you more about myself."
      double_check_used_before = gets.strip
      if double_check_used_before == "1"
        self.user_already_exists
      elsif double_check_used_before == "2"
        self.create_new_user
      end
    end
  end

  def create_new_user
    puts ""
    puts ""
    puts "Tell us a little about yourself. It will only take a moment."
    puts ""
    puts ""
    puts "What is your first name?"
    new_user_first_name = gets.strip
    puts ""
    puts ""
    puts "What is your last name?"
    new_user_last_name = gets.strip
    puts ""
    puts ""
    puts "Is there something you'd like to be called, other than your first name?"
    puts ""
    puts ""
    puts "1. Yes"
    puts "2. No"
    nick_name = gets.strip
    if nick_name == "1"
      puts ""
      puts ""
      puts "What would you like us to call you? (In other words, what is your nickname?)"
      new_user_nickname = gets.chomp
      puts ""
      puts ""
      puts "Well hello, #{new_user_nickname}. Let's get started!"
    elsif nick_name == "2"
      puts ""
      puts ""
      puts "Okay, great! We'll just call you #{new_user_first_name}."
    end
    User.create(first_name: new_user_first_name, last_name: new_user_last_name, nick_name: new_user_nickname)
    self.how_much_time?
  end




#---get time constraint
  def how_much_time?
    #how much time do you have 1. 15min, 2. 30 min, 3. 60 minutes
    puts ""
    puts ""
    puts "About how much time do you have?"
    puts ""
    puts ""
    puts "1. 15 minutes"
    puts "2. 30 minutes"
    puts "3. 60 minutes"
    puts ""
    puts ""
    puts "Please enter a number."
    puts ""
    puts ""
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
      puts ""
      puts ""
      puts "#{self.possibility.name}: #{self.possibility.description}"
      puts ""
      puts ""
      self.accept_or_reject
    when "2"
      self.possibility =  self.user.suggest_random_possibility(30)
      puts ""
      puts ""
      puts "#{self.possibility.name}: #{self.possibility.description}"
      puts ""
      self.accept_or_reject
    when "3"
      self.possibility = self.user.suggest_random_possibility(60)
      puts ""
      puts ""
      puts "#{self.possibility.name}: #{self.possibility.description}"
      puts ""
      self.accept_or_reject
    else
      self.how_much_time?
    end
  end


#------Accept or reject, save as Activity regardless

  def accept_or_reject
    puts ""
    puts ""
    puts "Would you like to accept or reject this possibility?"
    puts ""
    puts ""
    puts "1. Accept this possibility"
    puts "2. Reject this possibility. Suggest another."
    puts "3. Remove this possiblity from existance."
    puts ""
    self.accepted_or_rejected = gets.strip
    self.create_activity
  end

#------after accept don't autoquit ask if they want another activity or to quit

  def create_activity
    #------accepts activity
    if self.accepted_or_rejected == "1"
      self.activity = Activity.create(status: "accepted", user_id: self.user.id, possibility_id: self.possibility.id)
      self.complete_activity

    #-------reject activity
    elsif self.accepted_or_rejected == "2"
      self.activity = Activity.create(status: "rejected", user_id: self.user.id, possibility_id: self.possibility.id)
      puts ""
      puts ""
      puts "Suggesting another possibility..."
      puts ""
      puts ""
      self.suggest_possibility
        #--rejects and exclude
    elsif self.accepted_or_rejected == "3"
      self.activity = Activity.create(status: "rejected", user_id: self.user.id, possibility_id: self.possibility.id, exclude: true)
      puts ""
      puts "Got it! I won't show that possiblity again."
      self.suggest_possibility
    end

  end

  def complete_activity
    puts ""
    puts ""
    puts "Okay, now get busy!"
    puts ""
    puts "When you are finished, come back and press:"
    puts ""
    puts ""
    puts "1. If you have completed this activity"
    puts "2. If you got distracted and failed to complete the activity"
    puts ""
    puts ""
    self.completed_activity = gets.strip

    if self.completed_activity == "1"
      self.activity.status = "accepted and completed"
      self.activity.save
      #we need to add functionality to ask them to rate the activity
      puts ""
      self.get_rating
      puts ""
      puts "Thanks for your rating!"
      puts ""
      puts "Would you like us to suggest a new possibility?"
      puts ""
      puts "1. Yes, give me more."
      puts "2. No, I've had enough."
      puts ""
      puts ""
      self.suggest_another = gets.strip
      self.continue?
    elsif self.completed_activity == "2"
      self.activity.status = "accepted but not completed"
      self.activity.save
      puts ""
      puts ""
      puts "Would you like us to suggest a new possibility?"
      puts ""
      puts ""
      puts "1. Yes, give me more."
      puts "2. No, I've had enough. Let's quit the program."
      puts ""
      puts ""
      self.suggest_another = gets.strip
      self.continue?
    end
  end


  def continue?
    if self.suggest_another == "1"
      self.suggest_possibility
    elsif self.suggest_another == "2"
      exit
    end
  end

#------Asks for rating

  def get_rating

    puts "How much did you like #{self.possibility.name.downcase}?"
    puts ""
    puts "Rate this activity on a scale of 1 through 5."
    user_response = gets.strip
    if user_response == ""
      puts "We missed that."
      get_rating
    end
    self.activity.rate(user_response)
  end

end
