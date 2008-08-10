class Score < ActiveRecord::Base
  belongs_to :assignment
  belongs_to :student
  validate_constraints
end
