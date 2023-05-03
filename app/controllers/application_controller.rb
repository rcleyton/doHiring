class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if current_recruiter
      current_recruiter.recruiter_profile.nil? ?
        new_recruiters_dashboard_profile_path :
        recruiters_dashboard_home_index_path
    end
  end
end
