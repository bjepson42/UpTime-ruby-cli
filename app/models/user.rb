require 'active_record'
class User< ActiveRecord::Base
  has_many :activities
  has_many :possibilities, through: :activities

#---called on a user to suggest possiblity
  def suggest_random_possibility(duration, location_limit)
    Activity.get_non_exclude_possiblity(self.id, duration, location_limit)
  end



#--matches user input from cli against users in database compairing first_name and nick_name.
#--then informs user if they've been found based on resaults(functions as a check against double user creation)
#--or if not found, promps user for new input or allows them to indicate they are new.
  def self.name_search_and_greeting(user_name_response, cli_instance)

  user_name_array = user_name_response.split(" ")

  cli_instance.user = User.where("LOWER(first_name) = ? AND LOWER(last_name) = ?", "#{user_name_array[0]}".downcase, "#{user_name_array[1]}".downcase).first

  if cli_instance.user == nil
    cli_instance.user = User.where("LOWER(nick_name) = ? AND LOWER(last_name) = ?", "#{user_name_array[0]}".downcase, "#{user_name_array[1]}".downcase).first
  end
  if cli_instance.user
    if cli_instance.user.nick_name
      puts ""
      puts Rainbow("*").blue * 70
      puts ""
      puts ""
      puts ""
      puts ""
      puts ""
      puts Rainbow("Hi, #{cli_instance.user.nick_name}! We've found you in our records.").underline.bright
      puts ""
      puts ""
    else
      puts ""
      puts Rainbow("*").blue * 70
      puts ""
      puts ""
      puts ""
      puts ""
      puts ""
      puts Rainbow("Hi, #{cli_instance.user.first_name}! We've found you in our records.").underline.bright
      puts ""
      puts ""
    end
    puts "You're here because you have a bit of downtime, and you want to turn it into UPTIME!"
    puts ""
    puts ""
    Possibility.user_possibility_stats(cli_instance.user.id)
    puts ""
    puts ""
  else
    puts ""
    puts Rainbow("*").blue * 70
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts "We could not find you in our records. Are you sure you've used UPTIME on this computer before?"
    puts ""
    puts " 1. Yes. Perhaps I mispelled my name. I'll try again."
    puts " 2. No. I better tell you more about myself."
    puts ""
    double_check_used_before = gets.strip
    cli_instance.quit if double_check_used_before == "quit"
    if double_check_used_before == "1"
      cli_instance.user_already_exists
    elsif double_check_used_before == "2"
      cli_instance.create_new_user
    else
      cli_instance.what_was_that?
      User.name_search_and_greeting(user_name_response, cli_instanc)
    end
  end
end


#--if they've indicated they are new checks the database against existing first, last, and nick names. If not found creates new user, if found, loads the user found.
  def self.name_search_and_greeting_new(user_name_response, nick_name, cli_instance)
    user_name_array = user_name_response.split(" ")

    cli_instance.user = User.where("LOWER(first_name) = ? AND LOWER(last_name) = ?", "#{user_name_array[0]}".downcase, "#{user_name_array[1]}".downcase).first

    if cli_instance.user == nil
      cli_instance.user = User.where("LOWER(nick_name) = ? AND LOWER(last_name) = ?", "#{user_name_array[0]}".downcase, "#{user_name_array[1]}".downcase).first
    end
    if cli_instance.user
      if cli_instance.user.nick_name
        puts ""
        puts Rainbow("*").blue * 70
        puts ""
        puts ""
        puts ""
        puts ""
        puts ""
        puts Rainbow("Hi, #{cli_instance.user.nick_name}! We've found you in our records.").underline.bright
        puts ""
        puts ""
      else
        puts ""
        puts Rainbow("*").blue * 70
        puts ""
        puts ""
        puts ""
        puts ""
        puts ""
        puts Rainbow("Hi, #{cli_instance.user.first_name}! We've found you in our records.").underline.bright
        puts ""
        puts ""
      end
      puts "You're here because you have a bit of downtime





       and you want to turn it into UPTIME!"
      puts ""
      puts ""
      Possibility.user_possibility_stats(cli_instance.user.id)
      puts ""
      puts ""
    else
      if nick_name == nil
        puts ""
        puts Rainbow("*").blue * 70
        puts ""
        puts ""
        puts ""
        puts ""
        puts ""
        puts Rainbow("Hi, #{user_name_response.split(" ")[0]}! Welcome to UPTIME!").underline.bright
        puts ""
        puts ""
        puts "You're here because you have a bit of downtime and you want to turn it into UPTIME!"
        puts ""
        puts ""
      else
        puts ""
        puts Rainbow("*").blue * 70
        puts ""
        puts ""
        puts ""
        puts ""
        puts ""
        puts Rainbow("Hi, #{nick_name}! Welcome to UPTIME!").underline.bright
        puts ""
        puts ""
      end
      cli_instance.user = User.create(first_name: "#{user_name_response.split(" ")[0]}", nick_name: "#{nick_name}", last_name: "#{user_name_response.split(" ")[1]}")
    end
  end

end
