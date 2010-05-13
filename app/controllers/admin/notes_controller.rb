class Admin::NotesController < Admin::AdminController
  def new
    @note = Note.new
    respond_to do |format|
      format.html
      format.xml  { render :xml => @note }
    end
  end

  def create
    # Redirect back to articles page (or to thank you page)
    @note = Note.new(params[:note])
    @note.method = "web"
    respond_to do |format|
      if @note.save
        # TODO: Rotate this phrase in different languages
        flash[:notice] = "Thanks for the note!"
        format.html { redirect_to :frontpage_articles }
        format.xml  { render :xml => @note, :status => :created,
                      :location => @note }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @note.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

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
    redirect_to :unread_notes
  end


end
