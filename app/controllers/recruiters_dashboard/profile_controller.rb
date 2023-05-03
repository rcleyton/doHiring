class RecruitersDashboard::ProfileController < RecruitersDashboardController

  def show 
    @recruiter_profile = RecruiterProfile.find(params[:id])
  end
  
  def new
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

  private

  def recruiter_profile_params
    params.require(:recruiter_profile).permit(:recruiter_id, :full_name, 
    :document, :phone, :cell_phone, :sector, :number_employee)
  end
end