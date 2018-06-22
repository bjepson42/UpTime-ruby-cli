require_relative "../../app/models/cli.rb"
require_relative "../../app/models/user.rb"
require_relative "../../app/models/activity.rb"
require_relative "../../config/environment.rb"
require "spec_helper"

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
#-----Requires that test_possiblity be uncommented in seed data before seeding the database in order to pass. See line 30 in seeds.rb
  xit "check 'test' activities average is 3" do
    activity_test = Activity.find(1)
    expect { activity_test.activity_stats }.to output(/3/).to_stdout
  end


end
