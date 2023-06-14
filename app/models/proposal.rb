class Proposal < ApplicationRecord
  validates :start_date, :salary_offered, :benefits_offered, 
  :job_functions, :company_expectations, :bonus, :additional_information, presence: true
  belongs_to :candidature
end
