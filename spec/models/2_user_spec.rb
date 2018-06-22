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
