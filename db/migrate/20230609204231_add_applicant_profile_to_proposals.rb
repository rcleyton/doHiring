class AddApplicantProfileToProposals < ActiveRecord::Migration[6.1]
  def change
    add_reference :proposals, :applicant_profile, foreign_key: true
  end
end
