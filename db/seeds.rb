require 'require_all'
require_all 'app'
require_relative "../config/environment.rb"

#-----Test user please do not move
test_user = User.create(first_name: "Testing", last_name: "Me", nick_name: "Test")
#-------------------------------------------------------------------


#----User Seeds

will = User.create(first_name: "William", last_name: "Ley", nick_name: "Will")
oren = User.create(first_name: "Oren", last_name: "Magid")


#-----------Posibilites seeds
# t.string   "name"
# t.string   "description"
# t.integer  "physical_intensity"
# t.integer  "mental_intensity"
# t.integer  "fun_index"
# t.integer  "duration_in_minutes"
# t.string   "necessary_location"
# t.boolean  "others_required"
# t.datetime "created_at" <---auto generated
# t.datetime "updated_at" <---auto generated



#--------Test Possibility please do not move and uncomment to run rspec
#test_possiblity = Possibility.create(name: "Test", description: "Test this", past_tense: "tested this", physical_intensity: 1, mental_intensity: 5, fun_index: 3)
#------------------------------------------------------------------------------






read = Possibility.create(name: "Read", description: "Grab a nearby book, or open up your Kindle, and enjoy a little reading.", past_tense: "read", physical_intensity: 1, mental_intensity: 3, fun_index: 3)

take_a_walk = Possibility.create(name: "Take a Walk", description: "Take a stroll—-perhaps on a path you've never taken before.", past_tense: "took a walk", physical_intensity: 3, mental_intensity: 1, fun_index: 3)

go_for_a_run = Possibility.create(name: "Go for a Run", description: "Grab a pair of shoes and go for a run or a light jog. Enjoy some fresh air.", past_tense: "went for a run", physical_intensity: 5, mental_intensity: 1, fun_index: 3, duration_in_minutes: 30, necessary_location: "not work")

call_a_friend = Possibility.create(name: "Call a Friend", description: "Call up a friend you haven't spoken to in a while. If you need an ice breaker, tell them *why* you are calling!", past_tense: "called a friend", physical_intensity: 2, mental_intensity: 3, fun_index: 3)

call_a_familiy_memeber = Possibility.create(name: "Call a Family Member", description: "Connect with a family member you haven't chatted with in a while.", past_tense: "called someone in your family", physical_intensity: 2, mental_intensity: 3, fun_index: 3)

look_out_the_window = Possibility.create(name: "Look out the window", description: "Gaze into the distance—-or at least the not so near.", past_tense: "looked out the window", physical_intensity: 1, mental_intensity: 1, fun_index: 3)

clean_house = Possibility.create(name: "Clean Around the House", description: "You'e been putting off cleaning until tomorrow. Well, tomorrow is today! Spend a little time cleaning or straightening up.", past_tense: "spent some time cleaning",physical_intensity: 3, mental_intensity: 1, fun_index: 3, necessary_location: "home")

clean_work_space = Possibility.create(name: "Clean or Organize Your Work Space", description: " Perhaps you've got a pile of papers you keep moving around, or maybe your desk is a mess. Get to it!", past_tense: "cleaned your workspace", physical_intensity: 3, mental_intensity: 1, fun_index: 3, necessary_location: "work")

veg = Possibility.create(name: "Time to Veg!", description: "It's time to veg! Kick back and relax, and forget your worries.", past_tense: "vegged out", physical_intensity: 1, mental_intensity: 1, fun_index: 3, necessary_location: "home")

play_instrument = Possibility.create(name: "Play a Musical Instrument", description: "Use this time to play a musical instrument, if indeed you play a musical instrument.", past_tense: "made some sweet music", physical_intensity: 3, mental_intensity: 3, fun_index: 3, duration_in_minutes: nil, necessary_location: "home", others_required: nil)

listen_to_music = Possibility.create(name: "Listen to Music", description: "Crank up some music and have some fun. (If you're at work, we hope you brought your headphones!)", past_tense: "listened to some music", physical_intensity: 3, mental_intensity: 3, fun_index: 3, duration_in_minutes: nil, necessary_location: nil, others_required: nil)

meditate = Possibility.create(name: "Meditate", description: "Find a comfortable place to sit and meditate. For some guidance, visit: http://how-to-meditate.org/", past_tense: "meditated", physical_intensity: 1, mental_intensity: 4, fun_index: 3, duration_in_minutes: nil, necessary_location: nil, others_required: nil)

draw_a_picture = Possibility.create(name: "Draw a Picture", description: "Grab a pencil or pen and some paper. Draw a pretty picture, or just doodle.", past_tense: "drew or doodled",physical_intensity: 1, mental_intensity: 2, fun_index: 4, duration_in_minutes: nil, necessary_location: nil, others_required: nil)

dance = Possibility.create(name: "Dance", description: "Get off your butt and dance!", past_tense: "danced", physical_intensity: 4, mental_intensity: 1, fun_index: 5, duration_in_minutes: nil, necessary_location: "not work", others_required: nil)

play_a_sport = Possibility.create(name: "Play a Sport", description: "Suit up, grab whatever equipment you might need, and get sporty!", past_tense: "played a sport", physical_intensity: 5, mental_intensity: 2, fun_index: 5, duration_in_minutes: 30, necessary_location: "not work", others_required: nil)

take_a_nap = Possibility.create(name: "Take a Nap", description: "Find a quiet place to curl up and take a quick nap.", past_tense: "took a nap. Welcome back", physical_intensity: 1, mental_intensity: 1, fun_index: 3, duration_in_minutes: 15, necessary_location: "home", others_required: nil)

play_a_video_game = Possibility.create(name: "Play a Video Game", description: "Take this time to have some fun playing a video game. Try: http://www.addictinggames.com/", past_tense: "played a video game", physical_intensity: 3, mental_intensity: 3, fun_index: 3, duration_in_minutes: nil, necessary_location: "home", others_required: nil)

write = Possibility.create(name: "Do Some Writing", description: "Grab a pencil and some paper, or open up a word processor, and spend some time writing. Be creative.", past_tense: "did some writing", physical_intensity: 1, mental_intensity: 4, fun_index: 3, duration_in_minutes: nil, necessary_location: nil, others_required: nil)

new_possibility = Possibility.create(name: "Create a New Possibility for the Future", description: "Take a few minutes to create a new possibility from scratch.", past_tense: "created a new possibility", physical_intensity: 1, mental_intensity: 4, fun_index: 3, duration_in_minutes: 15, necessary_location: nil, others_required: nil)

walk_around_office = Possibility.create(name: "Walk Around The Office", description: "Get up, stretch your legs, and get some coffee or just get away from the screen for a while", past_tense: "took a walk around the office", physical_intensity: 3, mental_intensity: 1, fun_index: 3, necessary_location: "work")

stretch = Possibility.create(name: "Stretch", description: "Get up and do some stretching!", past_tense: "took a walk", physical_intensity: 3, mental_intensity: 1, fun_index: 3)





#----------- Testing seed data do not remove
activity_test_5 = Activity.create(status: "accepted", user_id: 1, possibility_id: 1, rating: 5)

activity_test_2 = Activity.create(status: "accepted", user_id: 1, possibility_id: 1, rating: 3)

activity_test_1 = Activity.create(status: "accepted", user_id: 1, possibility_id: 1, rating: 5)
activity_test_4 = Activity.create(status: "accepted", user_id: 1, possibility_id: 1, rating: 2)
activity_test_3 = Activity.create(status: "accepted", user_id: 1, possibility_id: 1, rating: 1)
