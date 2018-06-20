require_relative "../app/models/cli.rb"
require "spec_helper"

describe "Cli" do
  let(:cli) {Cli.new} #<---this lets you use 'cli' as a universal new object


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


  it "exit should quit program" do
    allow(cli.where_are_you_at?).to receive(:gets).and_return("quit")
    expect { cli.where_are_you_at? }.to output(/Thank you for using UPTIME!/).to_stdout
  end

end
