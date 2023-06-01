class RemoveVacancyLevelFromVacancies < ActiveRecord::Migration[6.1]
  def change
    remove_column :vacancies, :vacancy_level
  end
end
