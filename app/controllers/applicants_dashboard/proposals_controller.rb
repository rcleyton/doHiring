class ApplicantsDashboard::ProposalsController < ApplicantsDashboardController
  def index
    @applicant = current_applicant
    @proposals = @applicant.applicant_profile.proposals
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