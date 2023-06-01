class CreateVacancyLevels < ActiveRecord::Migration[6.1]
  def change
    create_table :vacancy_levels do |t|
      t.string :level

      t.timestamps
    end
  end
end
