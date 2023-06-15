class AddStatusToVacancies < ActiveRecord::Migration[6.1]
  def change
    add_column :vacancies, :status, :string, default: 'Ativo'
  end
end
