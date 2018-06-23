require 'pry'
require 'rainbow'

class Cli
  attr_accessor :user, :possibility, :limit_time, :accepted_or_rejected, :activity, :completed_activity, :suggest_another, :activity, :new_possibility_name, :new_possibility_description, :new_possibility_duration, :new_possibility_required_location, :new_possibility, :limit_place

  def call
     self.start
  end
#---welcome user and gets input about previous use
  def start
    puts ""
    puts Rainbow("*").blue * 70
    puts ""
    puts ""
    puts ""
    puts ""
    puts Rainbow("Welcome to UPTIME!").bright.underline
    puts ""
    puts "You may type \"quit\" at any time to leave UPTIME."
    puts ""
    puts "Have you used UPTIME on this computer before?"
    puts ""
    puts " 1. Yes"
    puts " 2. No"
    puts ""
    used_before = gets.strip
    self.quit if used_before == "quit"
    if used_before == "1"
      self.user_already_exists
    elsif used_before == "2"
      self.create_new_user
    else
      self.what_was_that?
      self.start
    end
  end

#--If user indicates they have used the program calls user helper method which searches for and greats users if found
  def user_already_exists
    puts ""
    puts Rainbow("*").blue * 70
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts "Please type your name (first and last)."
    puts ""
    user_name_response = gets.chomp.split.map(&:capitalize).join(' ')
    self.quit if user_name_response == "quit"
    User.name_search_and_greeting(user_name_response, self)
    self.where_are_you_at?
  end
#----------------should all be in user below?
  def create_new_user
    puts ""
    puts Rainbow("*").blue * 70
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts "Tell us a little about yourself. It will only take a moment."
    puts ""
    puts "What is your name?"
    puts ""
    new_user_full_name = gets.strip
    self.quit if new_user_full_name == "quit"
    puts ""
    puts Rainbow("*").blue * 70
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts "Is there something you'd like to be called, other than your first name?"
    puts ""
    puts " 1. Yes"
    puts " 2. No"
    puts ""
    nick_name = gets.strip
    if nick_name == "1"
      puts ""
      puts Rainbow("*").blue * 70
      puts ""
      puts ""
      puts ""
      puts ""
      puts ""
      puts "What would you like us to call you? (In other words, what is your nickname?)"
      puts ""
      new_user_nickname = gets.chomp.split.map(&:capitalize).join(' ')
      User.name_search_and_greeting_new(new_user_full_name, new_user_nickname, self)
    elsif nick_name == "2"
      User.name_search_and_greeting_new(new_user_full_name, nil, self)
      user_name_array = new_user_full_name.split(" ")
    elsif nick_name == "quit"
      self.quit
    end
    self.where_are_you_at?
  end
#-------------------above to user



#------user sets location constraint->moves to time constraint

  def where_are_you_at?
    puts ""
    puts Rainbow("*").blue * 70
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts "We are going to ask you a few basic questions, and suggest an"
    puts "activity for you based on your answers. This won't take long."
    puts ""
    puts ""
    puts "Where are you?"
    puts ""
    puts " 1. Home"
    puts " 2. Work"
    puts " 3. Somewhere else"
    puts ""
    puts "Please enter a number."
    puts ""
    user_response = gets.strip
    self.quit if user_response == "quit"
    if user_response == "1"
      self.limit_place = "home"
    elsif user_response == "2"
      self.limit_place = "work"
    elsif user_response == "3"
      self.limit_place = "not work or home"
    else
      self.what_was_that?
      self.where_are_you_at?
    end
    self.how_much_time?
    puts ""
  end


#---user sets time constraint ->moves to gen. possibilities
  def how_much_time?
    puts ""
    puts Rainbow("*").blue * 70
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts "About how much time do you have?"
    puts ""
    puts " 1. Less than 15 minutes."
    puts " 2. 15 minutes - 30 minutes."
    puts " 3. More than 30 minutes."
    puts ""
    puts ""
    puts "Please enter a number."
    puts ""
    user_time = gets.strip
    self.quit if user_time == "quit"
    case user_time
      when "1"
        self.limit_time = 15
      when "2"
        self.limit_time = 30
      when "3"
        self.limit_time = 60
      else
        self.what_was_that?
        self.how_much_time?
    end
    self.suggest_possibility
  end

#----generates possibilities, displays user status by calling on User helper
  def suggest_possibility
    puts ""
    puts Rainbow("*").blue * 70
    puts ""
    puts ""
    puts ""
    self.possibility = self.user.suggest_random_possibility(self.limit_time, self.limit_place)
    puts ""
    puts ""
    puts Rainbow("#{self.possibility.name}: #{self.possibility.description}").bright.underline
    puts ""
    puts ""
    self.possibility.possibility_stats(user.id)
    puts ""
    puts ""
    self.accept_or_reject
  end


#------Accept or reject

  def accept_or_reject
    puts "Would you like to accept or reject this possibility?" + Rainbow(" (#{self.possibility.name})").bright
    puts ""
    puts ""
    puts " 1. Accept this possibility."
    puts " 2. Reject this possibility for now. Suggest another."
    puts " 3. Reject this possibility, and never show it to me again!"
    puts ""
    puts ""
    puts ""
    self.accepted_or_rejected = gets.strip
    self.quit if self.accepted_or_rejected == "quit"
    if ["1", "2", "3"].all? { |i| self.accepted_or_rejected != i}
      self.what_was_that?
      self.accept_or_reject
    end
    self.create_activity
  end

#-----creates a new activity entry from the suggested possiblity if rejected or accepted with special case of Create New Possiblity
  def create_activity
    if self.accepted_or_rejected == "1"
#-----------move this section to possiblity creation method under possiblity see note: 1 in todo
      if self.possibility.name == "Create a New Possibility for the Future"
        puts ""
        puts Rainbow("*").blue * 70
        puts ""
        puts ""
        puts ""
        puts ""
        puts ""
        puts "Okay, let's begin!"
        puts ""
        puts "What should we call your new possibility? A short, decriptive name will do the trick."
        puts ""
        self.new_possibility_name = gets.strip
        self.quit if self.new_possibility_name == "quit"
        puts ""
        puts Rainbow("*").blue * 70
        puts ""
        puts ""
        puts ""
        puts ""
        puts ""
        puts "Write a brief description (about a sentence or two) of your new possibility."
        puts ""
        self.new_possibility_description = gets.strip
        self.quit if self.new_possibility_description == "quit"
        puts ""
        puts Rainbow("*").blue * 70
        puts ""
        puts ""
        puts ""
        puts ""
        puts ""
        puts "About how long should it take to complete this possibility?"
        puts ""
        puts ""
        puts " 1. Less than 15 minutes."
        puts " 2. 15 minutes - 30 minutes."
        puts " 3. More than 30 minutes."
        puts ""
        puts ""
        puts "Please enter a number."
        self.new_possibility_duration = gets.strip
        self.quit if self.new_possibility_duration == "quit"
        puts ""
        puts Rainbow("*").blue * 70
        puts ""
        puts ""
        puts ""
        puts ""
        puts ""
        puts "Is this possibility something I can do at home, at work, anywhere but work, or anywhere at all?"
        puts ""
        puts " 1. I can only do this at home"
        puts " 2. I can only do this at work"
        puts " 3. I can do this anywhere but work"
        puts " 4. I can do this anywhere at all"
        puts ""
        puts ""
        puts "Please enter a number."
        self.new_possibility_required_location = gets.strip
        self.quit if self.new_possibility_required_location == "quit"
        create_new_possibility
#---------------------------
      else
      self.activity = Activity.create(status: "accepted", user_id: self.user.id, possibility_id: self.possibility.id)
      puts ""
      puts ""
      self.complete_activity
      end

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
      puts Rainbow("*").blue * 70
      puts ""
      puts ""
      puts ""
      puts ""
      puts ""
      puts "Got it! I won't show that possiblity again."
      self.suggest_possibility
    end

  end

#---------creates new possibility
  def create_new_possibility
    self.new_possibility = Possibility.create(name: self.new_possibility_name, description: self.new_possibility_description)

    if new_possibility_duration == "1"
      self.new_possibility.duration_in_minutes = 15
    elsif new_possibility_duration == "2"
      self.new_possibility.duration_in_minutes = 30
    elsif new_possibility_duration == "3"
      self.new_possibility.duration_in_minutes = 60
    end

    if new_possibility_required_location == "1"
      self.new_possibility.necessary_location = "home"
    elsif new_possibility_duration == "2"
      self.new_possibility.necessary_location = "work"
    elsif new_possibility_duration == "3"
      self.new_possibility.necessary_location = "not work"
    elsif new_possibility_duration == "4"
      self.new_possibility.necessary_location = nil
    end
    self.new_possibility.save


    self.activity = Activity.create(status: "accepted and completed", user_id: self.user.id,
      possibility_id: self.possibility.id)
    puts ""
    puts Rainbow("*").blue * 70
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts "Awesome! You just created a new possibility for the future!"
    puts ""
    puts ""
    self.get_rating
    puts ""
    puts "Thanks for your rating!"
    puts ""
  end

#------Asks user about completion of possiblity and saves status of activity
  def complete_activity
    if self.activity.status != "accepted and completed"
      puts ""
      puts Rainbow("*").blue * 70
      puts ""
      puts ""
      puts ""
      puts ""
      puts ""
      puts "Okay, now get busy!" + Rainbow(" (#{self.possibility.name})").bright
      puts ""
      puts "When you are finished, come back and press:"
      puts ""
      puts ""
      puts "1. If you have completed this activity"
      puts "2. If you got distracted and failed to complete the activity"
      puts ""
      puts ""
      self.completed_activity = gets.strip
      self.quit if self.completed_activity == "quit"
      if ["1", "2"].all? { |i| self.completed_activity != i}
        self.what_was_that?
        self.complete_activity
      end
      if self.completed_activity == "1"
        self.activity.status = "accepted and completed"
        self.activity.save
        puts ""
        self.get_rating
        puts ""
        puts Rainbow("*").blue * 70
        puts ""
        puts ""
        puts ""
        puts ""
        puts ""
        puts "Thanks for your rating!"
        puts ""
        puts ""
        self.activity.activity_stats
        puts ""
        self.suggest_new_possibility?
      elsif self.completed_activity == "2"
        self.activity.status = "accepted but not completed"
        self.activity.save
        puts ""
        puts Rainbow("*").blue * 70
        puts ""
        puts ""
        puts ""
        puts ""
        self.suggest_new_possibility?
      end
    end
  end




#------helper methods for CLI ------------------------------------------------


#----asks user if they want to continue, alter the perameters, or stop
  def suggest_new_possibility?
      puts ""
      puts "Would you like us to suggest a new possibility?"
      puts ""
      puts "1. Yes, give me more."
      puts "2. Yes and I'd like to change my time and location first."
      puts "3. No, I've had enough."
      puts ""
      self.suggest_another = gets.strip
      self.quit if self.suggest_another == "quit"
      if ["1", "2", "3"].all? { |i| self.suggest_another != i}
        self.what_was_that?
        self.suggest_new_possibility?
      end
      self.continue?
    end
#-----paths the user based on responses from the continue prompt in suggest_new_possibility?
  def continue?
    if self.suggest_another == "1"
      self.suggest_possibility
    elsif self.suggest_another == "2"
      self.where_are_you_at?
    elsif self.suggest_another == "3"
      exit
    end
  end

#------Asks for rating

  def get_rating
    puts ""
    puts Rainbow("*").blue * 70
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    if self.possibility.past_tense
      puts "You just #{self.possibility.past_tense}. How much did you enjoy this?"
      puts ""
    else
      puts "You just completed the possibility called '#{self.possibility.name}'. How much did you enjoy this?"
      puts ""
    end
    puts ""
    puts "Rate this activity on a scale of 1 through 5."
    puts ""
    user_response = gets.strip
    self.quit if user_response == "quit"
    if ["1", "2", "3", "4", "5"].all? { |i| user_response != i}
      self.what_was_that?
      self.get_rating
    end
    self.activity.rate(user_response)
  end

#-----quit text and exit function
  def quit
      puts ""
      puts ""
      puts Rainbow("*").blue * 70
      puts ""
      puts ""
      puts ""
      puts "Thank you for using UPTIME!"
      puts ""
      puts "Have a fantastic day!"
      puts ""
      puts ""
    exit
  end

#-----what was that text for blank or unexpected input

  def what_was_that?
    puts "-" * 70
    puts "*****  I didn't catch that  *****"
    puts ""
    puts "Would you please try a different answer?"
    puts "-" * 70
  end


end
