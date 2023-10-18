class ApplicantProfile < ApplicationRecord
  validates :first_name, :last_name, :birthdate, :rg, :cpf, :gender,
            :civil_status, :professional_goals, presence: true
            
  belongs_to :applicant
  has_many :candidatures
  has_many :vacancies, through: :candidatures
  has_many :comments
  has_many :proposals
  has_one_attached :avatar

  has_one :address
  accepts_nested_attributes_for :address
end
