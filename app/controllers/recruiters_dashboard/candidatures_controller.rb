class RecruitersDashboard::CandidaturesController < RecruitersDashboardController
  def show
    @candidature = Candidature.find(params[:id])
  end

  def favorite
    @candidature = Candidature.find(params[:id])
    if @candidature.update(favorite: true)
      redirect_to recruiters_dashboard_candidature_path(@candidature)
    end
  end

  def not_favorite
    @candidature = Candidature.find(params[:id])
    if @candidature.update(favorite: false)
      redirect_to recruiters_dashboard_candidature_path(@candidature)
    end
  end

  def change_application_status
    @candidature = Candidature.find(params[:id])
    new_status = params[:candidature][:status]
    @candidature.update(status: new_status)
  end
end