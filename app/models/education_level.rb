class EducationLevel < ApplicationRecord
  extend Enumerize 
  belongs_to :applicant_profile

  enumerize :course_status, in: { 
    in_progress: 0, 
    completed: 5, 
    suspended: 10 
  }

  enumerize :course_type, in: { 
    undergraduate: 0, 
    postgraduate: 5, 
    high_school: 10,
    elementary_school: 15,
    technical: 20, 
    associate_degree: 25, 
    mba: 30,
    doctorate: 35, 
    specialization: 40 
  }
end
