require 'rails_helper'

RSpec.describe InformationController, :type => :controller do

  describe "GET about" do
    it "returns http success" do
      get :about
      expect(response).to be_success
    end
  end

  describe "GET teams" do
    it "returns http success" do
      get :teams
      expect(response).to be_success
    end
  end

  describe "GET map_to_msj" do
    it "returns http success" do
      get :map_to_msj
      expect(response).to be_success
    end
  end

  describe "GET 2014_place_winners" do
    it "returns http success" do
      get :2014_place_winners
      expect(response).to be_success
    end
  end

  describe "GET hotels" do
    it "returns http success" do
      get :hotels
      expect(response).to be_success
    end
  end

  describe "GET results_prior_years" do
    it "returns http success" do
      get :results_prior_years
      expect(response).to be_success
    end
  end

  describe "GET champions_1990-2013" do
    it "returns http success" do
      get :champions_1990-2013
      expect(response).to be_success
    end
  end

end
