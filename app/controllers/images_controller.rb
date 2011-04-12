class ImagesController < ApplicationController

  before_filter :find_image, :only => [:show, :method_missing, :destroy]

  def new
    @image = Image.new
  end
  def index
    @images = Image.all
  end
  
  def show
    send_file @image.image.path, :filename => @image.image_file_name,
        :content_type => @image.image_content_type
  end

  def create
    @images = Image.where(["state = ?", "temp"])
    if @images != nil
      @images.each do |image|
        image.destroy;
      end
    end
    if params[:image] != nil
      @image = Image.create(params[:image])
      @image.state = "temp"
      @image.save
    end
    render :action => :new
  end


  def destroy

    File.delete(@image.image.path)
    @image.delete
  end

=begin
  def preview_for_pc
    send_file @image.image.path(:preview_for_pc), :filename => @image.image_file_name,
        :content_type => @image.image_content_type
  end

  def thumb
    send_file @image.image.path(:thumb), :filename => @image.image_file_name,
        :content_type => @image.image_content_type
  end
=end

  def method_missing(key, *args)

    text = key.to_s
    matchedtext = text[/size_for_\w+/];
    if matchedtext != nil
      size = matchedtext.sub(/size_for_/, "");
       @image = Image.find(params[:id])
      send_file @image.image.path(:"#{size}"), :filename => @image.image_file_name,
        :content_type => @image.image_content_type
    end
    
  end

  private
    def find_image
      @image = Image.find(params[:id])
  rescue ActiveRecord::RecordNotFound
     flash[:alert] = "The image you were looking for could not be found."
     redirect_to projects_path
    end

end
