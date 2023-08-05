require 'rails_helper'

RSpec.describe "SpotsController", type: :request do

	before(:each) do
	  @spot = FactoryBot.create(:spot)
	  @parking = FactoryBot.create(:parking)
	end

  describe "GET index" do
    it "show spot successfully" do
      get '/spots'
      expect(response).to have_http_status(200)
    end
  end

  describe "Spot create" do
  	let(:spot_params) {{spot: { name: "A23" ,nearest_entry: 100, occupied: false, parkings: { id: @parking.id } }}}  	
  	it "create spot successfully" do
  		post "/spots", params: spot_params
  		expect(response).to have_http_status(201)
  	end
  end

  describe "GET#Show Spot" do
    it "show details of spot" do
      get "/spots/#{@spot.id}"
      expect(response).to have_http_status(200) 
    end
  end

  describe "PATCH#Update spot" do
    let(:spot_params) {{spot: {name: "A30", nearest_entry: 100, occupied: false, parkings: { id: @parking.id }} }}
    it "update the cast" do
      patch "/spots/#{@spot.id}", params: spot_params
      expect(response).to have_http_status(200)
    end
  end

  describe "Delete#delete spot" do
    it "delete spot" do 
      delete "/spots/#{@spot.id}" 
      expect(response).to have_http_status(200)
    end
  end

end