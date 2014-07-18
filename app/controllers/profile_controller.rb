class ProfileController < ApplicationController
  before_action :authenticate_user!, :load_profile

  def show
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to profile_path, notice: "Profile saved!"
    else
      # redirect_to edit_profile_path, flash: { error: "There was an error. Please try again."}
      render :edit, alert: "There was an error. Please try again."
    end
  end

  private

    def load_profile
      @profile = current_user.profile
    end

    def profile_params
      params.require(:profile).permit(:name, :address, :address2, :city, :state, :zip_code, :phone_number)
    end
end
