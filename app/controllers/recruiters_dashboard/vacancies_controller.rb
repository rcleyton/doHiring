class RecruitersDashboard::VacanciesController < RecruitersDashboardController
  def show
    @vacancy = Vacancy.find(params[:id])
      rescue ActiveRecord::RecordNotFound
      redirect_to recruiters_dashboard_home_index_path
  end

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

  def edit
    @vacancy = Vacancy.find(params[:id])
  end

  def update
    @vacancy = Vacancy.find(params[:id])
    if @vacancy.update(vacancy_params)
      redirect_to recruiters_dashboard_vacancy_path(@vacancy)
    else
      render :edit
    end
  end

  private
  def vacancy_params
    params.require(:vacancy).permit(:code, :title, :description, :vacancy_level,
    :working_model, :salary, :benefits, :location, :recruiter_profile_id)
  end
end