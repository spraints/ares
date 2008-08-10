class Student < ActiveRecord::Base
  has_many :scores
  belongs_to :course_session
  validate_constraints
end
