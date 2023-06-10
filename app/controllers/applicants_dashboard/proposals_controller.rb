class ApplicantsDashboard::ProposalsController < ApplicantsDashboardController
  def index
    @applicant = current_applicant
    @proposals = @applicant.applicant_profile.proposals
  end

  def show
    @proposal = Proposal.find(params[:id])
  end
end