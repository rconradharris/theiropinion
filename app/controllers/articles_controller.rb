class ArticlesController < ApplicationController
  before_filter :login_required, :except => [ :frontpage ]

  # Public pages
  def frontpage
    @articles = Article.find_for_frontpage(:limit => 8)
    respond_to do |format|
      format.html
      format.xml  { render :xml => @articles }
    end
  end

  # Admin pages
  def index
    @articles = Article.find(:all)
    respond_to do |format|
      format.html
      format.xml  { render :xml => @articles }
    end
  end


  def unposted
    @articles = Article.find_all_by_is_posted(false)
    respond_to do |format|
      format.html
      format.xml  { render :xml => @articles }
    end
  end

  def edit
    @article = Article.find(params[:id])
    respond_to do |format|
      format.html
      format.xml  { render :xml => @article }
    end
  end

  def update
    @article = Article.find(params[:id])
    case params[:commit]
    when 'Update'
      @article.update_attributes(params[:article])
      redirect_to(:unposted_articles) and return
    when 'Unpost'
      @article.unpost
      redirect_to(:articles) and return
    when 'Update and Post'
      if @article.post(params[:article])
        flash[:notice] = "Article Posted"
        redirect_to(:articles) and return
      else
        render :action => :edit
      end
    else
      raise Exception, "unknown action"
    end
  end


end
