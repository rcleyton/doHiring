class ApplicantProfile < ApplicationRecord
  validates :first_name, :last_name, :birthdate, :rg, :cpf, :gender,
            :civil_status, :professional_goals, presence: true
            
  belongs_to :applicant
  has_many :candidatures
  has_many :vacancies, through: :candidatures
end
