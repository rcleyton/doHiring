class ChangeCourseTypeStringToInteger < ActiveRecord::Migration[6.1]
  def change
    change_column :education_levels, :course_type, :integer, using: 'course_type::integer'
  end
end
