class Vacancy < ApplicationRecord
  belongs_to :recruiter_profile
  has_many :candidatures
  has_many :applicant_profiles, through: :candidatures
end
