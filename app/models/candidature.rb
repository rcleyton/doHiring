class Candidature < ApplicationRecord
  validates :reason_application, presence: true
  
  belongs_to :applicant_profile
  belongs_to :vacancy
end
