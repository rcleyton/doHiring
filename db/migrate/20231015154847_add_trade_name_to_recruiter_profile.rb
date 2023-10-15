class AddTradeNameToRecruiterProfile < ActiveRecord::Migration[6.1]
  def change
    add_column :recruiter_profiles, :trade_name, :string
  end
end
