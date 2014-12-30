class PicturesController < ApplicationController

  def create
    data_string = params[:uri].gsub('data:image/png;base64,','')
    data_string = data_string.gsub(' ', '+')
    img = Base64.decode64(data_string)

    @user = User.find(session[:userid])
    # title = "default"

    @picture = Picture.create(image: data_string,
                              image_binary: img,
                              user_id: @user.id)

    title = @user.username + "_" + @user.created_at.to_s

    @picture.update(title: title)

    redirect_to root_path
  end

  def show_image
    @picture = Picture.last
    @image_url = show_image_file(@picture)
  end

  def show_image_file(picture)
    send_data picture.image_binary, :type => "image/png", :disposition => 'inline'
    image_url = "data:image/png;base64," + picture.image
  end


end
