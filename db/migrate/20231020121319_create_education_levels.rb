class CreateEducationLevels < ActiveRecord::Migration[6.1]
  def change
    create_table :education_levels do |t|
      t.string :course_name
      t.string :course_type
      t.string :institution_name
      t.string :course_status
      t.date :start_date
      t.date :end_date
      t.date :expected_end_date
      t.references :applicant_profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
