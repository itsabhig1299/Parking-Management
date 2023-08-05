require 'rails_helper'

RSpec.describe Spot, type: :model do
  context "Validation Test" do 
    it "ensure presence of some attributses" do 
      spot = Spot.create()
      expect(spot.errors.messages[:name]).to eq(["can't be blank"])
      expect(spot.errors.messages[:nearest_entry]).to eq(["can't be blank"])
      #expect(spot.errors.messages[:occupied]).to eq(["can't be blank"])
      #expect(spot.errors.messages[:parking_id]).to eq(["can't be blank"])
    end
  end
end
