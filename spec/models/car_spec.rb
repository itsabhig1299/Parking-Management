require 'rails_helper'

RSpec.describe Car, type: :model do
  context "Validation Test" do 
    it "ensure presence of some attributses" do 
      car = Car.create()
      expect(car.errors.messages[:color]).to eq(["can't be blank"])
      expect(car.errors.messages[:registration_number]).to eq(["can't be blank"])
    end
  end

  context "Association Test" do
    it "has_many_through" do 
      association = Car.reflect_on_association(:spots)
      expect(association.macro).to eq(:has_many_through)
    end
  end
end
