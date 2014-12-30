class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    username = params[:user][:username]
    if User.find_by(username: username) != nil
      redirect_to new_user_path, notice: "Username already in use"
    else
      @user = User.new(users_params)
    end

    if @user != nil && @user.save
      session[:userid] = @user.id
      redirect_to root_path
    else
      redirect_to new_user_path, notice: "Failed to create account. "
    end
  end

  def users_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
