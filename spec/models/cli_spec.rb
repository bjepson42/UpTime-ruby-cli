require_relative "../../app/models/cli.rb"
require_relative "../../app/models/user.rb"
require_relative "../../app/models/activity.rb"
require_relative "../../config/environment.rb"
require "spec_helper"



describe User do
  let(:user) { User.new }


  it "Test Me returns the user.first_name Testing" do
    cli_instance = Cli.new
  #   # allow(cli.how_much_time?).stub(gets: '1')
    User.name_search_and_greeting("Testing Me", cli_instance)
    expect(cli_instance.user.first_name).to eq("Testing")
   end

   it "finds an exisiting user in db if existing user tries to create new user" do
     cli_instance = Cli.new
   #   # allow(cli.how_much_time?).stub(gets: '1')
     User.name_search_and_greeting_new("Test Me", "Test", cli_instance)
     expect(cli_instance.user.first_name).to eq("Testing")
    end

end

describe Activity do
  let(:activity) { Activity.new }

  it "sets activity rating to be 3" do
    activity.rate(3)
    expect(activity.rating).to eq(3)
  end

  it "sets activity rating to 5 if user input is over 5" do
    activity.rate(10)
    expect(activity.rating).to eq(5)
  end
  
  it "sets activity rating to 1 if user input is under 1" do
    activity.rate(-3)
    expect(activity.rating).to eq(1)
  end

#---getting nil...
  # it "check 'test' activities average is 3" do
  #   activity_test = double
  #   activity_test = Activity.create(possibility_id: 1, user_id: 1)
  #   expect(activity_test.activity_stats).to output(/Your average rating for this activity, on a scale of 1-5/).to_stdout
  # end


end





describe "Cli" do
  let(:cli) { Cli.new } #<---this lets you use 'cli' as a universal new object



#   it "quit input should exit program where_are_you_at?" do
#     #allow(STDOUT).stub(:gets).and_return("quit")
#     #cli.where_are_you_at?.stub!("quit")
#     #allow(STDIN).to receive(:gets).and_return("quit")
#     #cli.where_are_you_at?.gets
# #--------This line works!
#     # cli.where_are_you_at?
#     # allow(cli.where_are_you_at?).stub(gets: 'quit')
#     Object.any_instance.stub(gets: 'quit')
# #--------This works
#     expect(cli.where_are_you_at?).to output(/Thank you for using UPTIME!/).to_stdout
#     #expect { cli.where_are_you_at? }.to output(/Thank you for using UPTIME!/).to_stdout
#   end




 it "returns the output of what was that?" do
 #   # cli.how_much_time?
 #   # allow(cli.how_much_time?).stub(gets: '1')
   allow(cli).to receive(:gets).and_return("quit")
   expect(cli.how_much_time?).to output(/Thank you for using UPTIME!/).to_stdout
  end

end





  # it "stuff the test is checking for" do
  #   variable = class.new #<--------this can be done with the line 5
  #   expect(method(arguments)).to eq something
  # end
  # it "stores the user's name to a `name` instance variable" do
  #   greeting = Hello.new
  #
  #   allow(greeting).to receive(:gets).and_return("Brian")
  #   greeting.say
  #
  #   expect(greeting.name).to eq "Brian"
  # end


  # it "responds to 'exit'" do
  #   self.stub(:gets).and_return("exit")
  #   exit_output = capture_stdout { run(songs) }
  #   expect(exit_output).to include("Goodbye")
  # end

#------this should check to see if a function calls self.quit if it receives "quit"
