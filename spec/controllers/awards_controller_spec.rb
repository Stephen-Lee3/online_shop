require 'rails_helper'

RSpec.describe AwardsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #judge" do
    it "returns http success" do
      get :judge
      expect(response).to have_http_status(:success)
    end
  end

end
