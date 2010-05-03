class Article < ActiveRecord::Base
  def Article.find_for_frontpage(opts={})
    opts[:limit] ||= 10
    Article.find(:all, :conditions => { :hide => false },
                 :limit => opts[:limit])
  end
end
