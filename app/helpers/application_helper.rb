module ApplicationHelper
  def total_vacancies
    vacancies = Vacancy.all.count
  end
end
