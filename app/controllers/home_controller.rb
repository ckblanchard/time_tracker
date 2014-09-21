class HomeController < ApplicationController
  before_action :authenticate_user!, except: :index
  layout :choose_layout

  def index
  end

  def dashboard
  end

  private

    def choose_layout
      user_signed_in? ? "angular" : "application"
    end
end