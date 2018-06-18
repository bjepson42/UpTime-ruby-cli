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

read = Possibility.create(name: "Read a Book", description: "read a book", physical_intensity: 1, mental_intensity: 3, fun_index: 3)

take_a_walk = Possibility.create(name: "Take a Walk", description: "Take a stroll on a path you've never taken before.", physical_intensity: 3, mental_intensity: 1, fun_index: 3)

go_for_a_run = Possibility.create(name: "Go for a Run", description: "Grab a pair of shoes and go for a run or a light job and get some fresh air", physical_intensity: 5, mental_intensity: 1, fun_index: 3, duration_in_minutes: 30)

call_a_friend = Possibility.create(name: "Call a Friend", description: "Chose a friend you haven't spoken to in a while and call them up and chat. Never forget that you can always talk about the weather!", physical_intensity: 2, mental_intensity: 3, fun_index: 3)

call_a_familiy_memeber = Possibility.create(name: "Call a Family Member", description: "Connect with a family member you haven't chatted with in a while.", physical_intensity: 2, mental_intensity: 3, fun_index: 3)

look_out_the_window = Possibility.create(name: "Look out the window", description: "Gaze into the distance or at least the not so near.", physical_intensity: 1, mental_intensity: 1, fun_index: 3)

clean_house = Possibility.create(name: "Clean Around the House", description: "You know you have those things you put off until tomorrow. Well, tomorrow is today!", physical_intensity: 3, mental_intensity: 1, fun_index: 3, necessary_location: "home")

clean_work_space = Possibility.create(name: "Clean Around Your Work Space", description: "That pile of papers you keep shuffling or that work email you haven't sent yet. Sort them!", physical_intensity: 3, mental_intensity: 1, fun_index: 3, necessary_location: "work")

watch_tv = Possibility.create(name: "Time to Veg!", description: "It's time to veg! Kick back and relax, worry free.", physical_intensity: 1, mental_intensity: 3, fun_index: 3, necessary_location: "home")
