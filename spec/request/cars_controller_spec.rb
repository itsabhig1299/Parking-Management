require 'rails_helper'

RSpec.describe "CarsController", type: :request do
  before(:each) do
    @car = FactoryBot.create(:car)
  end 

  describe "GET index" do
    it "show cars successfully" do
      get '/cars'
      expect(response).to have_http_status(200)
    end
  end

  #it goes to index of car action
  describe "Post create" do
    let(:car_params) {{car: { color: "white", registration_number: "UP 57 AB 4545" }}}
    it "create car successfully" do
      post '/cars', params: car_params
      expect(response).to have_http_status("201")
    end
  end

  describe "GET#Show Car" do
    it "show details of car" do
      get "/cars/#{@car.id}"
      expect(response).to have_http_status(200) 
    end
  end

  describe "PATCH#Update car" do
    let(:car_params) {{car: { color: "blue", registration_number: "UP 57 AB 4500" }}}
    it "update the car" do
      patch "/cars/#{@car.id}", params: car_params
      expect(response).to have_http_status(200)
    end
  end

  describe "Delete#delete car" do
    it "delete car" do
      delete "/cars/#{@car.id}"
      expect(response).to have_http_status(200)
    end
  end
end