class AddStatusToProposals < ActiveRecord::Migration[6.1]
  def change
    add_column :proposals, :status, :string, default: 'Propotsta enviada'
  end
end
