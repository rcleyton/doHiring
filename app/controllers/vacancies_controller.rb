class VacanciesController < ApplicationController
  def index
    if params[:search]
      @vacancies = Vacancy.where("code ILIKE ? OR title ILIKE ? OR description ILIKE ?", 
                   "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
    else  
      all_vacancies = Vacancy.all
      active_vacancies, inactive_vacancies = all_vacancies.partition { |vacancy| vacancy.status == 'Ativa' }
      @vacancies = active_vacancies + inactive_vacancies
    end
  end

  def show
    @vacancy = Vacancy.find(params[:id])
    unless @vacancy.status == 'Ativa'
      redirect_to vacancies_path
    end
    rescue ActiveRecord::RecordNotFound
    redirect_to vacancies_path
  end
end