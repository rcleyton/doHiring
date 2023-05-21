# require 'securerandom'

class Vacancy < ApplicationRecord
  belongs_to :recruiter_profile
  has_many :candidatures
  has_many :applicant_profiles, through: :candidatures

  before_create :generate_code

  private
  def generate_code
    self.code = SecureRandom.alphanumeric(8).upcase
  end
end
