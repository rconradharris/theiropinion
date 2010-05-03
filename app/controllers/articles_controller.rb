class ArticlesController < ApplicationController

  def index
    @articles = Article.find_for_frontpage(:limit => 10)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end

end
