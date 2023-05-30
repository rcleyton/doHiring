class Comment < ApplicationRecord
  validates :content, presence: true
  
  belongs_to :applicant_profile
  belongs_to :recruiter_profile
  belongs_to :candidature
end