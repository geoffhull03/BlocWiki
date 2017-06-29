require 'rails_helper'

RSpec.describe UserController, type: :controller do

  describe "GET #name" do
    it "returns http success" do
      get :name
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #email" do
    it "returns http success" do
      get :email
      expect(response).to have_http_status(:success)
    end
  end

end
