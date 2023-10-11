class AddFieldsToVacancies < ActiveRecord::Migration[6.1]
  def change
    add_column :vacancies, :requirements, :text
    add_column :vacancies, :desired_skill, :text
    add_column :vacancies, :contract_type, :string
  end
end
