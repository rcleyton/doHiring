class RecruitersDashboard::HomeController < RecruitersDashboardController
  def index
    @vacancies = Vacancy.where(recruiter_profile_id: current_recruiter)
  end
end
