require 'rails_helper'

RSpec.describe TournamentsController, :type => :controller do

  describe "GET name:string" do
    it "returns http success" do
      get :name:string
      expect(response).to be_success
    end
  end

  describe "GET size:integer" do
    it "returns http success" do
      get :size:integer
      expect(response).to be_success
    end
  end

end
