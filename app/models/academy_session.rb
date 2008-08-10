class AcademySession < ActiveRecord::Base
  has_many :courses, :class_name => 'CourseSession'
  validate_constraints
end
