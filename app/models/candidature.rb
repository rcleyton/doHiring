class Candidature < ApplicationRecord
  belongs_to :applicant_profile
  belongs_to :vacancy
end
