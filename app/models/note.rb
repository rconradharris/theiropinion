class Note < ActiveRecord::Base
  validates_presence_of :subject, :body, :submitter, :email

  def Note.find_for_triage
    Note.find_all_by_is_read(false)
  end

  def mark_read
    self.is_read = true
    save
  end
end
