class CreateProposals < ActiveRecord::Migration[6.1]
  def change
    create_table :proposals do |t|
      t.date :start_date
      t.string :salary_offered
      t.text :benefits_offered
      t.text :job_functions
      t.text :company_expectations
      t.string :bonus
      t.text :additional_information
      t.references :candidature, null: false, foreign_key: true
      t.references :applicant_profile, null: false, foreign_key: true
      t.references :recruiter_profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
