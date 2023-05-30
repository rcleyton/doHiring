class RecruitersDashboard::CandidaturesController < RecruitersDashboardController
  def show
    @candidature = Candidature.find(params[:id])
  end
end