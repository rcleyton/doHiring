class ChangeFullNameToLegalName < ActiveRecord::Migration[6.1]
  def change
    rename_column :recruiter_profiles, :full_name, :legal_name
  end
end
