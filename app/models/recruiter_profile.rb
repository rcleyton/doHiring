class RecruiterProfile < ApplicationRecord
  validates :full_name, :document, :phone, :cell_phone, :sector,
            :number_employee, :about_us, presence: true
            
  belongs_to :recruiter
  has_many :vacancies
  has_many :comments
  has_many :proposals
  has_one_attached :avatar
  has_one :address

  accepts_nested_attributes_for :address
end
