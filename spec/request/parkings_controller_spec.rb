require 'rails_helper'

RSpec.describe "ParkingsController", type: :request do
  before(:each) do
    @parking = FactoryBot.create(:parking)
  end 

  describe "GET index" do
    it "show parkings successfully" do
      get '/parkings'
      expect(response).to have_http_status(200)
    end
  end

  describe "Post create" do
    let(:parking_params) {{parking: { name: "Nav Parking" }}}
    it "create parking successfully" do
      post '/parkings', params: parking_params
      expect(response).to have_http_status("201")
    end
  end

  describe "GET#Show Parking" do
    it "show details of parking" do
      get "/parkings/#{@parking.id}"
      expect(response).to have_http_status(200) 
    end
  end

  describe "PATCH#Update parking" do
    let(:parking_params) {{parking: { name: "Alex Parking" }}}
    it "update the parking" do
      patch "/parkings/#{@parking.id}", params: parking_params
      expect(response).to have_http_status(200)
    end
  end

  describe "Delete#delete parking" do
    it "delete parking" do
      delete "/parkings/#{@parking.id}"
      expect(response).to have_http_status(200)
    end
  end
end