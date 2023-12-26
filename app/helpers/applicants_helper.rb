module ApplicantsHelper
  def applicant_has_profile?
    current_applicant.applicant_profile.present?
  end
end
