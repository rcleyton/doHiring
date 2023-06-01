class VacancyLevel < ApplicationRecord
  has_many :vacancies

  def to_s
    level
  end
end
