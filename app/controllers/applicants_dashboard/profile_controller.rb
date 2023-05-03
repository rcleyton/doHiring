class ApplicantsDashboard::ProfileController < ApplicantsDashboardController
  def show
    @applicant_profile = ApplicantProfile.find(params[:id])
    redirect_to applicants_dashboard_home_index_path if @applicant_profile != current_applicant.applicant_profile
    rescue ActiveRecord::RecordNotFound
    redirect_to applicants_dashboard_home_index_path
  end

  def new
    redirect_to applicants_dashboard_profile_path(current_applicant.applicant_profile) if 
    current_applicant.applicant_profile.present?
    @applicant_profile = ApplicantProfile.new
  end

  def create
    @applicant_profile = ApplicantProfile.new(applicant_profile_params)
    if @applicant_profile.save
      redirect_to applicants_dashboard_profile_path(@applicant_profile)
    else  
      render :new
    end
  end

  def edit
    @applicant_profile = ApplicantProfile.find(params[:id])
  end

  def update
    @applicant_profile = ApplicantProfile.find(params[:id])
    if @applicant_profile.update(applicant_profile_params)
      redirect_to applicants_dashboard_profile_path
    else
      render :edit
    end
  end

  private
  def applicant_profile_params
    params.require(:applicant_profile).permit(:applicant_id, :first_name,
    :last_name, :birthdate, :rg, :cpf, :gender, :civil_status,
    :professional_goals)
  end
end