class Vacancy < ApplicationRecord
  validates :title, :description, :working_model, :salary,
            :benefits, :location, :vacancy_level_id, presence: true

  belongs_to :recruiter_profile
  belongs_to :vacancy_level
  
  has_many :candidatures
  has_many :applicant_profiles, through: :candidatures

  before_create :generate_code

  private
  def generate_code
    self.code = SecureRandom.alphanumeric(8).upcase
  end
end
