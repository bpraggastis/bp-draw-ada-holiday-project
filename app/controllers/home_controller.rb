class HomeController < ApplicationController

  def index
    if session[:pictureid] != nil
      @img = Picture.find(session[:pictureid]).image
    else
      @img = Picture.last.image
    end

  end

  def login
    @user = User.find_by(username: params[:username])
    if @user == nil
      redirect_to new_user_path, notice: "Please Create An Account"
    else
      if @user.authenticate(params[:password])
        start_session(@user.id)
      else
        redirect_to new_user_path, notice: "Login Failed. Please Try Again."
      end
    end
  end


  def start_session(user_id)
    session[:userid] = user_id
    redirect_to root_path
  end

  def destroy
    session[:userid] = nil
    redirect_to root_path, notice: "You have successfully Logged Out."
  end

end
