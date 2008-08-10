class FieldOfStudy < ActiveRecord::Base
  has_many :courses
  validate_constraints
end
