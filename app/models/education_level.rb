class EducationLevel < ApplicationRecord
  belongs_to :applicant_profile

  enum course_status: { 
    in_progress: 0, 
    completed: 5, 
    suspended: 10 
  }

  enum course_type: { 
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
