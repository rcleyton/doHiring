class AddVacancyLevelToVacancies < ActiveRecord::Migration[6.1]
  def change
    add_reference :vacancies, :vacancy_level, foreign_key: true
  end
end
