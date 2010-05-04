class Article < ActiveRecord::Base
  validates_presence_of :url, :title
  validates_presence_of :description, :author, :source, :if => :posting?
  validates_presence_of :publication_date, :if => :posting?
  validates_format_of :publication_date, 
                      :with => /^[0-9]{4}[-][0-9]{2}[-][0-9]{2}$/,
                      :if => :posting?
  def before_save
    self.status ||= "unposted"
  end

  def posting?
    @posting
  end

  def Article.find_for_frontpage(opts={})
    opts[:limit] ||= 10
    Article.find(:all, :conditions => { :status => 'posted' },
                 :limit => opts[:limit])
  end

  def hide
    self.status = "hidden"
    save
  end

  def post(attrs={})
    @posting = true
    self.status = "posted"
    returning(update_attributes(attrs)) do
      @posting = false
    end
  end

end
