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
end
