class RecruitersDashboardController < ApplicationController
  before_action :authenticate_recruiter!
  layout 'recruiters_dashboard'
end
