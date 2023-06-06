class Candidature < ApplicationRecord
  validates :reason_application, :status, presence: true
  
  belongs_to :applicant_profile
  belongs_to :vacancy
  has_many :comments
end
