class ApplicantsDashboard::CandidaturesController < ApplicantsDashboardController
  def show
    @candidature = Candidature.find(params[:id])
  end

  def new
    @candidature = Candidature.new
  end

  def create
    @candidature = Candidature.new(candidature_params)
    if @candidature.save
      redirect_to applicants_dashboard_candidature_path(@candidature)
    else
      render :new
    end
  end

  private
  def candidature_params
    params.require(:candidature).permit(:reason_application, :vacancy_id, 
    :applicant_profile_id)
  end
end