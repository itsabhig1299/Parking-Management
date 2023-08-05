require 'rails_helper'

RSpec.describe Parking, type: :model do
  context "Validation Test" do 
    it "ensure presence of attributse name" do 
      parking = Parking.create()
      expect(parking.errors.messages[:name]).to eq(["can't be blank"])
    end
  end

  context "Association Test" do
    it "has_many" do 
      association = Parking.reflect_on_association(:spots)
      expect(association.macro).to eq(:has_many)
    end
  end
end
