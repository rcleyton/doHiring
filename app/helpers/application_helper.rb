module ApplicationHelper
  def total_vacancies
    vacancies = Vacancy.all.count
  end

  def flash_class(type)
    case type
    when 'notice'
      'alert-success'
    when 'error'
      'alert-error'
    when 'alert'
      'alert-warning'
    else
      ''
    end
  end

  def badge_class_for_status(status)
    case status
    when "Ativo"
      "success"
    when "Pausada"
      "warning"
    when "Cancelada"
      "danger"
    else
      "secondary"
    end
  end

  def full_name(applicant_profile)
    "#{applicant_profile.first_name} #{applicant_profile.last_name}"
  end
end
