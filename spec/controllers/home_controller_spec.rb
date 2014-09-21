require "spec_helper"

RSpec.describe HomeController do
  let(:user) { FactoryGirl.create(:user) }

  describe  "GET #index" do

    it "renders the index view" do
      get :index
      expect(response).to render_template :index
    end

    it "does not have a user" do
      get :index
      expect(assigns(:user)).to eq nil
    end

  end

    it "renders the timer view with the angular template" do
      sign_in user
      get :dashboard
      expect(response).to render_template :dashboard
    end
  
end