class ArticlesController < ApplicationController
  # GET /articles
  # GET /articles.xml
  def index
    @articles = Article.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.xml
  def show
    @article = Article.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @article }
    end
  end

  # GET /articles/new
  # GET /articles/new.xml
  def new
    @article = Article.new
    @article.tagboxes.build
    @article.tagboxes.first.subtitles.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  # POST /articles
  # POST /articles.xml
  def create
    @article = Article.new(params[:article])
    respond_to do |format|
      if @article.save

        image = Image.find_by_id(@article.image_id)
        image.state = "uploaded"
        image.save
        format.html { redirect_to(@article, :notice => 'Article was successfully created.') }
        format.xml  { render :xml => @article, :status => :created, :location => @article }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.xml
  def update
    @article = Article.find(params[:id])
    params[:article][:tagboxes_attributes][:"0"][:subtitles_attributes].each_pair do |key, value|
      if value[:text] == nil or 
         value[:text] == ""
           params[:article][:tagboxes_attributes][:"0"][:subtitles_attributes].delete(:"#{key}")
      end
    end
    size_of_subtitles = params[:article][:tagboxes_attributes][:"0"][:subtitles_attributes].length
    params[:article]

    respond_to do |format|
      if @article.update_attributes(params[:article])
        @article.tagboxes.first.subtitles.each_with_index do |subtitle, index|
          if index > size_of_subtitles - 1
            subtitle.destroy
          end
        end
        format.html { redirect_to(@article, :notice => 'Article was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.xml
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to(articles_url) }
      format.xml  { head :ok }
    end
  end
end
