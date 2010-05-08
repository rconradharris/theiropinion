class Submission < ActiveRecord::Base
  validates_presence_of :url, :title

  def before_save
    self.status ||= "undecided"
  end

  def Submission.find_for_triage
    Submission.find(:all, :conditions => { :status => "undecided" })
    Submission.find(:all)
  end

  def approve
    Article.create(:url => url, :title => title, :description => description,
                   :submission_id => self.id)
    self.status = "approved"
    save
  end

  def reject
    self.status = "rejected"
    save
  end

end
