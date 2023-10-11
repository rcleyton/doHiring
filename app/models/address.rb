class Address < ApplicationRecord
  belongs_to :recruiter_profile, optional: true
  belongs_to :applicant_profile, optional: true

  validates :postal_code, :street, :number, :complement,
            :neighborhood, :city, :state, presence: true
end
