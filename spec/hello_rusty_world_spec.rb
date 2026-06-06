# frozen_string_literal: true

RSpec.describe HelloRustyWorld do
  it "has a version number" do
    expect(HelloRustyWorld::VERSION).not_to be nil
  end

  it "can call into Rust" do
    result = HelloRustyWorld::Greeting.new.say

    expect(result).to eq("Hello World!")
  end
end
