class AboutController < ApplicationController
  def show
    respond_to do |format|
      format.html { render :layout => 'public' }
    end
  end
end
