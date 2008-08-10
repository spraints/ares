class Assignment < ActiveRecord::Base
  belongs_to :course_session
  has_many :scores
  validate_constraints
end
