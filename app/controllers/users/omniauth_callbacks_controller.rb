class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def trello
    @user = User.from_trello_oauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:success, :success, kind: "Trello") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end
