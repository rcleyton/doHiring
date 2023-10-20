class ChangeCourseStatusStringToInteger < ActiveRecord::Migration[6.1]
  def change
    change_column :education_levels, :course_status, :integer, using: 'course_status::integer'
  end
end
