class RemoveRecriterIdAndApplicantIdFromProposals < ActiveRecord::Migration[6.1]
  def change
    remove_column :proposals, :recruiter_profile_id
    remove_column :proposals, :applicant_profile_id
  end
end
