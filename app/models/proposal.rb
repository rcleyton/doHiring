class Proposal < ApplicationRecord
  validates :start_date, presence: true
  belongs_to :candidature
end
