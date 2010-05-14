class Admin::NotesController < Admin::AdminController

  def index
    @notes = Note.find(:all)
    respond_to do |format|
      format.html
      format.xml  { render :xml => @notes }
    end
  end

  def unread
    @notes = Note.find_for_triage
    respond_to do |format|
      format.html { render :template => 'admin/notes/index' }
      format.xml  { render :xml => @notes }
    end
  end

  def edit
    @note = Note.find(params[:id])
    respond_to do |format|
      format.html
      format.xml  { render :xml => @note }
    end
  end

  def update
    @note = Note.find(params[:id])
    case params[:commit]
    when 'Mark Read'
      @note.mark_read
    else
      raise Exception, "unknown action"
    end
    redirect_to :unread_admin_notes
  end


end
