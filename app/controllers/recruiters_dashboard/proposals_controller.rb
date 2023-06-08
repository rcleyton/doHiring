class RecruitersDashboard::ProposalsController < RecruitersDashboardController
  def index
    @recruiter = current_recruiter # Supondo que você tenha um método para obter o recrutador atualmente logado
    @proposals = @recruiter.recruiter_profile.proposals
  end

  def show
    @proposal = Proposal.find(params[:id])
  end

  def new
    @proposal = Proposal.new
  end

  def create
    @candidature = Candidature.find(params[:candidature_id])
    @proposal = @candidature.build_proposal(proposal_params)
    if @proposal.save
      redirect_to recruiters_dashboard_proposal_path(@proposal)
    else  
      render :new
    end
  end

  private
  def proposal_params
    params.require(:proposal).permit(:start_date, :salary_offered, :benefits_offered, :job_functions, :company_expectations,
    :bonus, :additional_information)
  end
end
