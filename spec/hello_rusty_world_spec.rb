# frozen_string_literal: true

RSpec.describe HelloRustyWorld do
  it "has a version number" do
    expect(HelloRustyWorld::VERSION).not_to be nil
  end

  it "can call into Rust" do
    result = HelloRustyWorld.hello("world")

    expect(result).to eq("Hello world, from Rust!")
  end
end
