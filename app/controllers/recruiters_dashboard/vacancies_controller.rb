class RecruitersDashboard::VacanciesController < RecruitersDashboardController
  def new
    @vacancy = Vacancy.new
  end

  def create
    @vacancy = Vacancy.new(vacancy_params)
    if @vacancy.save
      redirect_to recruiters_dashboard_home_index_path
    else
      render :new
    end
  end

  private
  def vacancy_params
    params.require(:vacancy).permit(:title, :description, :vacancy_level,
    :working_model, :salary, :benefits, :location, :recruiter_profile_id)
  end
end