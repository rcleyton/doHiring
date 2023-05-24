class RecruiterProfile < ApplicationRecord
  validates :full_name, :document, :phone, :cell_phone, :sector,
            :number_employee, presence: true
            
  belongs_to :recruiter
end
