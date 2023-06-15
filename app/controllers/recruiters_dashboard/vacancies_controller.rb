class RecruitersDashboard::VacanciesController < RecruitersDashboardController
  def index 
    @vacancies = Vacancy.where(recruiter_profile_id: current_recruiter)
  end

  def show
    @vacancy = Vacancy.find(params[:id])
      rescue ActiveRecord::RecordNotFound
      redirect_to recruiters_dashboard_home_index_path
  end

  def new
    @vacancy = Vacancy.new
    @vacancy.build_vacancy_level
  end

  def create
    @vacancy = Vacancy.new(vacancy_params)
    if @vacancy.save
      redirect_to recruiters_dashboard_vacancy_path(@vacancy)
      flash[:notice] = "Vaga criada com sucesso."
    else
      flash.now[:error] = "Verifique o(s) campo(os) em vermelho."
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
      flash[:notice] = "Vaga atualizada com sucesso."
    else
      flash.now[:error] = "Verifique o(s) campo(os) em vermelho."
      render :edit
    end
  end

  private
  def vacancy_params
    params.require(:vacancy).permit(:code, :title, :description,
    :working_model, :salary, :benefits, :location, :recruiter_profile_id, :vacancy_level_id,
    :status)
  end  
end