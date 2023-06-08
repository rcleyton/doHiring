class RecruiterProfile < ApplicationRecord
  validates :full_name, :document, :phone, :cell_phone, :sector,
            :number_employee, presence: true
            
  belongs_to :recruiter
  has_many :vacancies
  has_many :comments
  has_many :proposals
end
