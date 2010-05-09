class Article < ActiveRecord::Base
  validates_presence_of :url, :title
  validates_presence_of :description, :author, :source,
                        :if => :is_posted?
  validates_presence_of :publication_date, :if => :is_posted?
  validates_format_of :publication_date, 
                      :with => /^[0-9]{4}[-][0-9]{2}[-][0-9]{2}$/,
                      :if => :is_posted?

  def post(attrs={})
    self.is_posted = true
    
    returning(update_attributes(attrs)) do |saved|
      self.is_posted = false unless saved
    end
  end

  def unpost
    self.is_posted = false
    save
  end
end
