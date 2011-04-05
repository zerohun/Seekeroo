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
    @images = Image.where(["state = ?", "temp"])
    if @images != nil
      @images.each do |image|
        image.destroy;
      end
    end
    @image = Image.create(params[:image])
    @image.state = "temp"
    @image.save
    render :partial => "preview"
  end

  def preview

  end


  def destroy
    image = Image.find(params[:id])

    File.delete(image.image.path)
    image.delete
  end
end
