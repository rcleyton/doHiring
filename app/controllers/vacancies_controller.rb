class VacanciesController < ApplicationController
  def index
    # @q = Vacancy.ransack(params[:q])
    # @vacancies = @q.result(distinct: true).all.order(created_at: :desc)
    # @vacancy_levels = VacancyLevel.pluck(:level, :id)
    # @working_models = Vacancy.distinct.pluck(:working_model)
    # @locations = Vacancy.distinct.pluck(:location)
    @vacancies = Vacancy.includes(:vacancy_level).all.order(created_at: :desc)
  end  
  
  def show
    @vacancy = Vacancy.find(params[:id])
    unless @vacancy.status == 'Ativo'
      redirect_to vacancies_path
    end
    rescue ActiveRecord::RecordNotFound
    redirect_to vacancies_path
  end
end