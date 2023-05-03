class CreateRecruiterProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :recruiter_profiles do |t|
      t.string :full_name
      t.string :document
      t.string :phone
      t.string :cell_phone
      t.string :sector
      t.integer :number_employee
      t.references :recruiter, null: false, foreign_key: true

      t.timestamps
    end
  end
end
