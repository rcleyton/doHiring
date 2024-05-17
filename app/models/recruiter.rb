# typed: false
# frozen_string_literal: true

class Recruiter < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :recruiter_profile, dependent: :destroy

  validates :email, uniqueness: true, email: true
  validates :password, length: { minimum: 8 }, if: -> { password.present? }
end
