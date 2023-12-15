module RecruitersHelper
  def recruiter_has_profile?
    current_recruiter.recruiter_profile.present?
  end
end
