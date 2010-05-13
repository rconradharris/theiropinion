class SubmissionsController < ApplicationController
  def new
    @submission = Submission.new
    respond_to do |format|
      format.html
      format.xml  { render :xml => @submission }
    end
  end

  def create
    @submission = Submission.new(params[:submission])
    @submission.method = "web"
    respond_to do |format|
      if @submission.save
        # TODO: Rotate this phrase in different languages
        flash[:notice] = "Thanks for the submission!"
        format.html { redirect_to :root }
        format.xml  { render :xml => @submission, :status => :created,
                             :location => @submission }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @submission.errors,
                             :status => :unprocessable_entity }
      end
    end
  end
end
