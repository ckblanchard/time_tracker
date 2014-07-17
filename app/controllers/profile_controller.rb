class ProfileController < ApplicationController
  before_action :authenticate_user!

  def show
    @profile = current_user.profile
  end
end
