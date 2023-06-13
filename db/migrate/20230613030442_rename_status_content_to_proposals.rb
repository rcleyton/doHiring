class RenameStatusContentToProposals < ActiveRecord::Migration[6.1]
  def up
    change_column_default :proposals, :status, from: 'Propotsta enviada', to: 'Aguardando resposta do candidato'
  end

  def down
    change_column_default :proposals, :status, from: 'Aguardando resposta do candidato', to: 'Propotsta enviada'
  end
end
