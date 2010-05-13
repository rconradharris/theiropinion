class Admin::SubmissionsController < Admin::AdminController
  def new
    @submission = Submission.new
    respond_to do |format|
      format.html
      format.xml  { render :xml => @submission }
    end
  end

  def create
    # Redirect back to articles page (or to thank you page)
    @submission = Submission.new(params[:submission])
    @submission.method = "web"
    respond_to do |format|
      if @submission.save
        # TODO: Rotate this phrase in different languages
        flash[:notice] = "Thanks for the submission!"
        format.html { redirect_to :frontpage_articles }
        format.xml  { render :xml => @submission, :status => :created,
                      :location => @submission }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @submission.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

  def index
    @submissions = Submission.find(:all)
    respond_to do |format|
      format.html
      format.xml  { render :xml => @submissions }
    end
  end

  def untriaged
    @submissions = Submission.find_for_triage
    respond_to do |format|
      format.html { render :template => 'submissions/index' }
      format.xml  { render :xml => @submissions }
    end
  end


  def edit
    @submission = Submission.find(params[:id])
    respond_to do |format|
      format.html
      format.xml  { render :xml => @submission }
    end
  end

  def update
    @submission = Submission.find(params[:id])
    case params[:commit]
    when 'Approve'
      @submission.approve
    when 'Reject'
      @submission.reject
    else
      raise Exception, "unknown action"
    end
    redirect_to :submissions
  end
end
