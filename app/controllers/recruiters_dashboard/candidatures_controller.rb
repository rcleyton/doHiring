class RecruitersDashboard::CandidaturesController < RecruitersDashboardController
  def show
    @candidature = Candidature.find(params[:id])
  end

  def favorite
    @candidature = Candidature.find(params[:id])
    if @candidature.update(favorite: true)
      redirect_to recruiters_dashboard_candidature_path(@candidature)
    else
      redirect_to @candidature, alert: 'Ocorreu um erro ao marcar a candidatura como destaque.'
    end
  end
end