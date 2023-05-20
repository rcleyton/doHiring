class ApplicationController < ActionController::Base
  layout :layout_by_resource

  def after_sign_in_path_for(resource)
    if current_applicant
      current_applicant.applicant_profile.nil? ?
        new_applicants_dashboard_profile_path :
        applicants_dashboard_home_index_path
    elsif current_recruiter
      current_recruiter.recruiter_profile.nil? ?
        new_recruiters_dashboard_profile_path :
        recruiters_dashboard_home_index_path
    end
  end

  private
  def layout_by_resource
    if devise_controller? && resource_name == :recruiter
      "authenticate_recruiter"
    elsif devise_controller? && resource_name == :applicant
      "authenticate_applicant"
    end
  end
end
