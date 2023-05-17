class ApplicantsDashboard::HomeController < ApplicantsDashboardController
  def index
    @candidatures = Candidature.where(applicant_profile_id: current_applicant)
  end
end
