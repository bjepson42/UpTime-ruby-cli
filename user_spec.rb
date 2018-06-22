require_relative "../../app/models/user.rb"
require_relative "../../app/models/cli.rb"
require_relative "../../config/environment.rb"
require "spec_helper"

require "active_record"

describe User do
  let(:user) { User.new }


  it "Will Ley returns the user William Ley" do
    cli_instance = Cli.new
  #   # allow(cli.how_much_time?).stub(gets: '1')
    User.name_search_and_greeting("Will Ley", cli_instance)
    expect(cli_instance.user.name).to eq("William")
   end

 end
