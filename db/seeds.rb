will = User.create(first_name: "William", last_name: "Ley", nick_name: "Will")
oren = User.create(first_name: "Oren", last_name: "Magid")

play_instrument = Possibility.create(name: "Play a Musical Instrument", description: "Use this time to play a musical instrument, if indeed you play a musical instrument.", physical_intensity: 3, mental_intensity: 3, fun_index: 3, duration_in_minutes: nil, necessary_location: nil, others_required: nil)

listen_to_music = Possibility.create(name: "Listen to Music", description: "Crank up some music and have some fun.", physical_intensity: 3, mental_intensity: 3, fun_index: 3, duration_in_minutes: nil, necessary_location: nil, others_required: nil)

meditate = Possibility.create(name: "Meditate", description: "Get comfortable. Meditate.", physical_intensity: 1, mental_intensity: 4, fun_index: 3, duration_in_minutes: nil, necessary_location: nil, others_required: nil)

draw_a_picture = Possibility.create(name: "Draw a Picture", description: "Grab a pencil or pen and some paper. Draw a pretty picture, or just doodle.", physical_intensity: 1, mental_intensity: 3, fun_index: 4, duration_in_minutes: nil, necessary_location: nil, others_required: nil)

dance = Possibility.create(name: "Dance", description: "Get off your butt and dance!", physical_intensity: 3, mental_intensity: 1, fun_index: 5, duration_in_minutes: nil, necessary_location: nil, others_required: nil)

play_a_sport = Possibility.create(name: "Play a Sport", description: "Suit up, grab whatever equipment you might need, and get sporty!", physical_intensity: 5, mental_intensity: 2, fun_index: 5, duration_in_minutes: 30, necessary_location: nil, others_required: nil)

take_a_nap = Possibility.create(name: "Take a Nap", description: "Find a quiet place to curl up and take a quick nap.", physical_intensity: 1, mental_intensity: 1, fun_index: 3, duration_in_minutes: 15, necessary_location: nil, others_required: nil)

play_a_video_game = Possibility.create(name: "Play a Video Game", description: "Take this time to have some fun playing a video game. Try: http://www.addictinggames.com/", physical_intensity: 3, mental_intensity: 3, fun_index: 3, duration_in_minutes: nil, necessary_location: nil, others_required: nil)

write = Possibility.create(name: "Do Some Writing", description: "Grab a pencil and some paper, or open up a word processor, and spend some time writing. Be creative.", physical_intensity: 1, mental_intensity: 4, fun_index: 3, duration_in_minutes: nil, necessary_location: nil, others_required: nil)
