class AddStatusToCandidatures < ActiveRecord::Migration[6.1]
  def change
    add_column :candidatures, :status, :string, default: "Candidatura Enviada"
  end
end
