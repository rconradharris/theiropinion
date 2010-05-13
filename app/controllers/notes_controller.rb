class NotesController < ApplicationController
  def new
    @note = Note.new
    respond_to do |format|
      format.html
      format.xml  { render :xml => @note }
    end
  end

  def create
    @note = Note.new(params[:note])
    @note.method = "web"
    respond_to do |format|
      if @note.save
        # TODO: Rotate this phrase in different languages
        flash[:notice] = "Thanks for the note!"
        format.html { redirect_to :root }
        format.xml  { render :xml => @note, :status => :created,
                             :location => @note }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @note.errors,
                             :status => :unprocessable_entity }
      end
    end
  end
end
