class PicturesController < ApplicationController

  def create
    @user = User.find(session[:userid])
    @picture = Picture.create(image: params[:uri],
                              user_id: @user.id)
    title = @user.username + "_" + @user.created_at.to_s
    @picture.update(title: title)
    render "pictures/show_image", target: "_blank"
  end

  def show_image
    if params[:id] != nil
      @picture = Picture.find(params[:id])
    else
      @picture = Picture.last
    end
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
