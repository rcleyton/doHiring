class VacanciesController < ApplicationController
  def index
    @vacancies = Vacancy.includes(:vacancy_level)
      .all
      .order(created_at: :desc)
      .page(params[:page])
  end  
  
  def show
    @vacancy = Vacancy.find(params[:id])
    puts "Recruiter Profile ID: #{@vacancy.recruiter_profile_id}"
    puts "Recruiter Profile Nome: #{@vacancy.recruiter_profile.full_name}"
    unless @vacancy.status == 'Ativo'
      redirect_to vacancies_path
    end
    rescue ActiveRecord::RecordNotFound
    redirect_to vacancies_path
  end

  def search
    @query = params[:q]
    @vacancies = Vacancy.search(@query).page(params[:page])
    if @vacancies.empty?
      flash.now[:alert] = "Nenhuma vaga encontrada"
    end
    if @query.blank?
      flash.now[:alert] = "Campo de busca não pode ficar em branco"
    end
    render :index
  end
end