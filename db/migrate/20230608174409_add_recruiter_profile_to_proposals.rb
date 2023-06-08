class AddRecruiterProfileToProposals < ActiveRecord::Migration[6.1]
  def change
    add_reference :proposals, :recruiter_profile, foreign_key: true
  end
end
