class VacanciesController < ApplicationController
  def index
    if params[:search]
      @vacancies = Vacancy.where("code ILIKE ? OR title ILIKE ? OR description ILIKE ?", 
                   "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
    else  
      @vacancies = Vacancy.all.order(created_at: :desc)
    end
  end

  def show
    @vacancy = Vacancy.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    redirect_to vacancies_path
  end
end