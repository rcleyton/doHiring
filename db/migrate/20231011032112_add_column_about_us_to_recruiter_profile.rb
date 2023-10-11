class AddColumnAboutUsToRecruiterProfile < ActiveRecord::Migration[6.1]
  def change
    add_column :recruiter_profiles, :about_us, :text
  end
end
