class RecruitersDashboard::ProfileController < RecruitersDashboardController
  before_action :find_profile, only: %i[ edit update]
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
    @recruiter_profile.build_address
  end

  def create
    @recruiter_profile = RecruiterProfile.new(recruiter_profile_params)
    if @recruiter_profile.save
      redirect_to  recruiters_dashboard_profile_path(@recruiter_profile)
      flash[:notice] = "Perfil criado com sucesso."
    else
      flash.now[:error] = "Verifique o(s) campo(os) em vermelho."
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @recruiter_profile.update(recruiter_profile_params)
      redirect_to recruiters_dashboard_profile_path
      flash[:notice] = "Perfil atualizado com sucesso."
    else
      flash.now[:error] = "Verifique o(s) campo(os) em vermelho."
      render :edit
    end
  end

  private
  def recruiter_profile_params
    params.require(:recruiter_profile).permit(:recruiter_id, :full_name, :avatar, :about_us,
    :document, :phone, :cell_phone, :sector, :number_employee, address_attributes: [:id, :street, :number, :postal_code,
                                                                                    :complement, :neighborhood,
                                                                                    :city, :state])
  end
  def find_profile
    @recruiter_profile = RecruiterProfile.find(params[:id])
  end
end