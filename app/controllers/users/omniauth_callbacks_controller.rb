class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
	def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)

		# Store facebook token obtained from omniauth in a session
    session["facebook_data"] = request.env["omniauth.auth"]

    sign_in_and_redirect @user, :event => :authentication
    set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
  end

end
