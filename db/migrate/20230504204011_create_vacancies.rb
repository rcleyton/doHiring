class CreateVacancies < ActiveRecord::Migration[6.1]
  def change
    create_table :vacancies do |t|
      t.string :title
      t.text :description
      t.string :vacancy_level
      t.string :working_model
      t.string :salary
      t.string :benefits
      t.string :location
      t.references :recruiter_profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
