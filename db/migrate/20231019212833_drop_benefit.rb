class DropBenefit < ActiveRecord::Migration[6.1]
  def change
    remove_column :vacancies, :benefits
  end
end
