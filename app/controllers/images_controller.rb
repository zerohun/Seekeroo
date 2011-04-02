class ImagesController < ApplicationController
  def new
    @image = Image.new
  end
  def index
    @images = Image.all
  end
  def show
    image = Image.find(params[:id])
    send_file image.image.path, :filename => image.image_file_name,
        :content_type => image.image_content_type
  end

  def create
    @image = Image.create(params[:image])
    @image.save!
    redirect_to @image

  end
end
