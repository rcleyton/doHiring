class ChangeAddressColumns < ActiveRecord::Migration[6.0]
  def change
    change_column :addresses, :recruiter_profile_id, :bigint, null: true
    change_column :addresses, :applicant_profile_id, :bigint, null: true
    rename_column :addresses, :cep, :postal_code
  end
end
