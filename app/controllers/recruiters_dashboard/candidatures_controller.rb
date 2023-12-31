class RecruitersDashboard::CandidaturesController < RecruitersDashboardController
  before_action :find_candidature, only: [:favorite, :not_favorite, :change_application_status]
  
  def index 
    @candidatures = Candidature.all
  end
  
  def show
    @candidature = Candidature.find(params[:id])
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