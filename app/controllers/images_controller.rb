class ImagesController < ApplicationController
  def new
    @image = Image.new
  end
  def show
    @image = Image.find(params[:image])
  end

  def create
    @image = Image.create(params[:image])
    @image.save!
  end
end
