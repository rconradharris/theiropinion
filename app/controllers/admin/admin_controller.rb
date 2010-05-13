class Admin::AdminController < ApplicationController
  before_filter :login_required, :except => [ :frontpage ]
  layout 'admin'
end
