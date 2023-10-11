class Vacancy < ApplicationRecord
  validates :title, :description, :working_model, :salary,
            :benefits, :location, :vacancy_level_id, :requirements,
            :desired_skill, :contract_type, presence: true

  belongs_to :recruiter_profile
  belongs_to :vacancy_level
  
  has_many :candidatures
  has_many :applicant_profiles, through: :candidatures

  before_create :generate_code

  # pagination
  paginates_per 5
  
  def self.search(query)
    where("title ILIKE ? OR description ILIKE ? OR code ILIKE ?", 
      "%#{query}%", "%#{query}%", "%#{query}%")
  end

  private
  def generate_code
    self.code = SecureRandom.alphanumeric(8).upcase
  end
end
