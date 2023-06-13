class ApplicantsDashboard::ProposalsController < ApplicantsDashboardController
  def index
    @applicant = current_applicant
    if @applicant.applicant_profile.present?
      @proposals = @applicant.applicant_profile.proposals
    else
      redirect_to new_applicants_dashboard_profile_path
    end
  end

  def show
    @proposal = Proposal.find(params[:id])
  end

  def accept
    @proposal = Proposal.find(params[:id])
    @proposal.update(status: 'Aceita')
    redirect_to applicants_dashboard_proposal_path(@proposal)
  end

  def decline
    @proposal = Proposal.find(params[:id])
    @proposal.update(status: 'Recusada')
    redirect_to applicants_dashboard_proposal_path(@proposal)
  end
end