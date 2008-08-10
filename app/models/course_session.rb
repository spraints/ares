class CourseSession < ActiveRecord::Base
  belongs_to :course
  has_many :students
  has_many :assignments
  validate_constraints
end
