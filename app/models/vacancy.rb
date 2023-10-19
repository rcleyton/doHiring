class Vacancy < ApplicationRecord
  validates :title, :description, :working_model, :salary,
            :benefits, :location, :vacancy_level_id, :requirements,
            :desired_skill, :contract_type, presence: true

  belongs_to :recruiter_profile
  belongs_to :vacancy_level
  
  has_many :candidatures
  has_many :applicant_profiles, through: :candidatures
  has_many :vacancy_benefits, inverse_of: :vacancy

  accepts_nested_attributes_for :vacancy_benefits, reject_if: :all_blank, allow_destroy: true
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
