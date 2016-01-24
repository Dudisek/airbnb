class ApplicationController < ActionController::Base
  include Clearance::Controller
	include ApplicationHelper
  skip_before_filter :verify_authenticity_token, only: :create
end
