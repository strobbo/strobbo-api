class ApplicationController < ActionController::Base
  protect_from_forgery

	def facebook_user
		@facebook_user ||= FbGraph::User.me(current_user.access_token).fetch
	end

	helper_method :facebook_user
end
