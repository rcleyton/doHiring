class CreateVacancyBenefits < ActiveRecord::Migration[6.1]
  def change
    create_table :vacancy_benefits do |t|
      t.string :benefit_name
      t.references :vacancy, null: false, foreign_key: true

      t.timestamps
    end
  end
end
