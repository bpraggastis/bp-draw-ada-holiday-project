class PicturesController < ApplicationController

  def create

      @user = User.find(session[:userid])
      @picture = Picture.create(image: params[:uri],
                                user_id: @user.id)
      title = @user.username + "_" + @user.created_at.to_s
      @picture.update(title: title)
      session[:pictureid] = nil
      render "pictures/show_image"

  end

  def show_image
    if params[:id] != nil
      @picture = Picture.find(params[:id])
    else
      @picture = Picture.last
    end
    session[:pictureid] = nil
  end

  def display_image
    @picture = Picture.last

  end

  def edit
    session[:pictureid] = params[:id]
    redirect_to root_path
  end

  def update
    @picture = Picture.find(session[:pictureid])
    @picture.update(image: params[:uri])
    session[:pictureid] = nil
    redirect_to show_image_path(@picture.id)
  end

  def index
    @user = User.find(session[:userid])
    @pictures = Picture.where(user_id: @user.id)
  end


  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to pictures_path
  end


end
