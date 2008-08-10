class Course < ActiveRecord::Base
  has_many :course_sessions
  belongs_to :field_of_study
  validate_constraints
end
