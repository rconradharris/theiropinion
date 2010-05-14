class ArticlesController < ApplicationController
  def index
    page_size = params[:page_size] ? params[:page_size].to_i : 8
    page = params[:page] ? params[:page].to_i : 1

    @articles = Article.find_all_by_is_posted(
      true, :limit => page_size + 1, :offset => (page-1) * page_size)

    # ask for one extra so we know whether to display More link
    if @articles.length > page_size
      @articles.pop
      @next_page = page + 1
    end

    respond_to do |format|
      format.html
      format.xml  { render :xml => @articles }
    end
  end

  def tagged
    page_size = params[:page_size] ? params[:page_size].to_i : 8
    page = params[:page] ? params[:page].to_i : 1
    
    @articles = Tag.find_by_name(params[:tag]).articles.find(
      :all, :limit => page_size + 1, :offset => (page-1) * page_size)

    # ask for one extra so we know whether to display More link
    if @articles.length > page_size
      @articles.pop
      @next_page = page + 1
    end

    respond_to do |format|
      format.html { render 'index' }
      format.xml  { render :xml => @articles }
    end
  end
end
