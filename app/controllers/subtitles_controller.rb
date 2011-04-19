class SubtitlesController < ApplicationController
  # GET /subtitles
  # GET /subtitles.xml
  def index
    @subtitles = Subtitle.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @subtitles }
    end
  end

  # GET /subtitles/1
  # GET /subtitles/1.xml
  def show
    @subtitle = Subtitle.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @subtitle }
    end
  end

  # GET /subtitles/new
  # GET /subtitles/new.xml
  def new
    @article = Article.new
    @subtitle = @article.subtitles.build
    respond_to do |format|
      format.html # new.html.erb
      format.js {render :layout =>false, :content_type => 'text/javascript' }
      format.xml  { render :xml => @subtitle }
    end
  end

  # GET /subtitles/1/edit
  def edit
    @subtitle = Subtitle.find(params[:id])
  end

  # POST /subtitles
  # POST /subtitles.xml
  def create
    @subtitle = Subtitle.new(params[:subtitle])

    respond_to do |format|
      if @subtitle.save
        format.html { redirect_to(@subtitle, :notice => 'Subtitle was successfully created.') }
        format.xml  { render :xml => @subtitle, :status => :created, :location => @subtitle }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @subtitle.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /subtitles/1
  # PUT /subtitles/1.xml
  def update
    @subtitle = Subtitle.find(params[:id])

    respond_to do |format|
      if @subtitle.update_attributes(params[:subtitle])
        format.html { redirect_to(@subtitle, :notice => 'Subtitle was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @subtitle.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /subtitles/1
  # DELETE /subtitles/1.xml
  def destroy
    @subtitle = Subtitle.find(params[:id])
    @subtitle.destroy

    respond_to do |format|
      format.html { redirect_to(subtitles_url) }
      format.xml  { head :ok }
    end
  end
end
