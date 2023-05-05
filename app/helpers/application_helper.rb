module ApplicationHelper
  def total_vacancies
    @vacancy = Vacancy.all.count
  end
end
