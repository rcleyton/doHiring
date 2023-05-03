class RecruitersDashboard::ProfileController < RecruitersDashboardController

  def show 
    @recruiter_profile = RecruiterProfile.find(params[:id])
    redirect_to recruiters_dashboard_home_index_path if @recruiter_profile != current_recruiter.recruiter_profile
    rescue ActiveRecord::RecordNotFound
    redirect_to recruiters_dashboard_home_index_path
  end

  def new
    redirect_to  recruiters_dashboard_profile_path(current_recruiter.recruiter_profile) if 
    current_recruiter.recruiter_profile.present?
    @recruiter_profile = RecruiterProfile.new
  end

  def create
    @recruiter_profile = RecruiterProfile.new(recruiter_profile_params)
    if @recruiter_profile.save
      redirect_to  recruiters_dashboard_profile_path(@recruiter_profile)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit 
    @recruiter_profile = RecruiterProfile.find(params[:id])
  end

  def update
    @recruiter_profile = RecruiterProfile.find(params[:id])
    if @recruiter_profile.update(recruiter_profile_params)
      redirect_to recruiters_dashboard_profile_path
    else
      render :edit
    end
  end

  private

  def recruiter_profile_params
    params.require(:recruiter_profile).permit(:recruiter_id, :full_name, 
    :document, :phone, :cell_phone, :sector, :number_employee)
  end
end