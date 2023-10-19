class RecruitersDashboard::VacanciesController < RecruitersDashboardController
  def index 
    @vacancies = Vacancy.where(recruiter_profile_id: current_recruiter)
  end

  def show
    @vacancy = Vacancy.find(params[:id])
    @vacancy_benefits = @vacancy.vacancy_benefits
    rescue ActiveRecord::RecordNotFound
    redirect_to recruiters_dashboard_home_index_path
  end

  def new
    if current_recruiter.recruiter_profile.present?
      @vacancy = Vacancy.new
      @vacancy.build_vacancy_level
    else 
      redirect_to new_recruiters_dashboard_profile_path
      flash[:alert] = "Complete seu perfil antes de publicar uma vaga."
    end
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
    :working_model, :salary, :location, :recruiter_profile_id, :vacancy_level_id,
    :status, :requirements, :desired_skill, :contract_type, vacancy_benefits_attributes: [:id, :benefit_name, :_destroy])
  end  
end