class Users::UsersController < ApplicationController
	before_filter :authenticate_user! 

  def show
    @user = User.find(params[:id])
    render 'users/show'
  end

end
