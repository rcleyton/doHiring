class VacanciesController < ApplicationController
  def index
    @vacancies = Vacancy.all.order(created_at: :desc)
  end

  def show
    @vacancy = Vacancy.find(params[:id])
  end
end