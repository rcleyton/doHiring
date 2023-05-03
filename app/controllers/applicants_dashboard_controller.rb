class ApplicantsDashboardController < ApplicationController
  before_action :authenticate_applicant!
  layout 'applicants_dashboard'
end
