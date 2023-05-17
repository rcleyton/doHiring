class ApplicantProfile < ApplicationRecord
  belongs_to :applicant
  has_many :candidatures
  has_many :vacancies, through: :candidatures
end
