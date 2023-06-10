class RecruitersDashboard::ProposalsController < RecruitersDashboardController
  def index
    @recruiter = current_recruiter
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
    @applicant_profile_id = @candidature.applicant_profile_id
    @recruiter_profile_id = current_recruiter.recruiter_profile.id
    @proposal = @candidature.build_proposal(proposal_params)
    if @proposal.save
      redirect_to recruiters_dashboard_proposal_path(@proposal)
    else  
      render :new
    end
  end

  private
  def proposal_params
    params.require(:proposal).permit(:start_date, :salary_offered, :benefits_offered, 
    :job_functions, :company_expectations, :applicant_profile_id, :recruiter_profile_id,
    :bonus, :additional_information)
  end
end
