class PicturesController < ApplicationController

  def create
    data_string = params[:uri].gsub('data:image/png;base64,','')
    data_string = data_string.gsub(' ', '+')
    img = Base64.decode64(data_string)
    # new_picture = File.new("default_title", w+)



    userid = 0
    title = "default_title"

    @picture = Picture.create(image: data_string,
                              image_binary: img,
                              title: title,
                              user_id: userid)

    redirect_to root_path
  end

  def show_image
    @picture = Picture.last
    send_data @picture.image_binary, :type => "image/png", :disposition => 'inline'
  end
  
end
