class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
  def twitter
    @user = User.find_or_create_from_twitter(request.env["omniauth.auth"])
    set_flash_message(:notice, :success, kind: "Twitter") if is_navigational_format?

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
    else
      redirect_to new_user_registration_url
    end
  end

end