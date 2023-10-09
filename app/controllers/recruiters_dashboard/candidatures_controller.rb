class RecruitersDashboard::CandidaturesController < RecruitersDashboardController
  before_action :find_candidature, only: [:show, :favorite, :not_favorite, :change_application_status]
  def show
  end

  def favorite
    if @candidature.update(favorite: true)
      redirect_to recruiters_dashboard_candidature_path(@candidature)
    end
  end

  def not_favorite
    if @candidature.update(favorite: false)
      redirect_to recruiters_dashboard_candidature_path(@candidature)
    end
  end

  def change_application_status
    new_status = params[:candidature][:status]
    @candidature.update(status: new_status)
  end
end

private

def find_candidature
  @candidature = Candidature.find(params[:id])
end