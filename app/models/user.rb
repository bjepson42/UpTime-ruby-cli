class User < ActiveRecord::Base
  has_many :activities
  has_many :possibilities, through: :activities

#---working on moving this to Possibility class and Activity class
  def suggest_random_possibility(duration, location_limit)
    Activity.get_non_exclude_possiblity(self.id, duration, location_limit)

    # Possibility.all.select do |possibility|
    #   possibility.duration_in_minutes == duration || possibility.duration_in_minutes == nil
    # end.sample
  end



  def create_and_save_activity(user_response)
    #two options: accept or reject, change status appropriately
    #if rejected, call method again

  end

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
    puts "You're here, because you have a bit of downtime, and you want to turn it into UPTIME!"
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
    double_check_used_before = gets.strip
    cli_instance.quit(double_check_used_before)
    if double_check_used_before == "1"
      cli_instance.user_already_exists
    elsif double_check_used_before == "2"
      cli_instance.create_new_user
    else
      cli_instance.what_was_that?
      cli_instance.user_already_exists
    end
  end
end

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
  puts "You're here, because you have a bit of downtime, and you want to turn it into UPTIME!"
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
  puts Rainbow("Okay, great! We'll just call you #{new_user_full_name.split(" ")[0]}. Let's get started!").underline.bright
end

end
#--------on log in,

end
