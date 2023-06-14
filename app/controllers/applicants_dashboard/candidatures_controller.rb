class ApplicantsDashboard::CandidaturesController < ApplicantsDashboardController
  def index
    @candidatures = Candidature.where(applicant_profile_id: current_applicant)
  end

  def show
    @candidature = Candidature.find(params[:id])
    @comments = Comment.all
  end

  def new
    @candidature = Candidature.new
  end

  def create
    @candidature = Candidature.new(candidature_params)
    @candidature.status = "Candidatura Enviada"
    if @candidature.save
      redirect_to applicants_dashboard_candidature_path(@candidature)
      flash[:notice] = "Candidatura enviada com sucesso."
    else
      flash.now[:error] = "Verifique o(s) campo(os) em vermelho."
      render :new
    end
  end

  private
  def candidature_params
    params.require(:candidature).permit(:reason_application, :vacancy_id, 
    :applicant_profile_id, :status)
  end
end