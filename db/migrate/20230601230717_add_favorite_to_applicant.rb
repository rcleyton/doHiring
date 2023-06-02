class AddFavoriteToApplicant < ActiveRecord::Migration[6.1]
  def change
    add_column :candidatures, :favorite, :boolean, default: false
  end
end
