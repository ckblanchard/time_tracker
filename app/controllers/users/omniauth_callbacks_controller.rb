class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
  def twitter
    @user = User.find_or_create_from_twitter(request.env["omniauth.auth"])
    set_flash_message(:notice, :success, kind: "Twitter") if is_navigational_format?

    # if sign_in :user, @user
    #   redirect_to root_path
    # else
    #   redirect_to new_user_registration_url
    # end

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, :kind => "Twitter") if is_navigational_format?
    else
      # session["devise.twitter_data"] = request.env["omniauth.auth"].except("extra")
      redirect_to new_user_registration_url
    end
  end

end