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
    @picture = Picture.last
  end




end
