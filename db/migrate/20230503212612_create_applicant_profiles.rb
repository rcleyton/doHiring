class CreateApplicantProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :applicant_profiles do |t|
      t.string :first_name
      t.string :last_name
      t.date :birthdate
      t.string :rg
      t.string :cpf
      t.string :gender
      t.string :civil_status
      t.string :professional_goals
      t.references :applicant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
