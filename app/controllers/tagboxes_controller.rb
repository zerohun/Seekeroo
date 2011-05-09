class TagboxesController < ApplicationController
  def new
    @tagbox = Tagbox.new
    @tagbox.subtitles.build
    @left = params[:left]
    @top = params[:top]
    @width = params[:width]
    @height = params[:height]
    @article_id = params[:article_id]
    respond_to do |format|
      format.html 
      format.js { render :layout => false}
    end
  end

  def create
    @tagbox = Tagbox.new(params[:tagbox])
    respond_to do |format|
      if @tagbox.save
        format.js { render :layout => false }
      else
        format.js { render :js => "alert('its failed')"}
      end
    end
  end
end
