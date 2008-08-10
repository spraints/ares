module ValidatesConstraints
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def validate_constraints
      columns.each do |column|
        next if column.primary
        validates_presence_of column.name unless column.null
        validates_length_of column.name, :maximum => column.limit unless column.limit.nil?
      end
    end
  end
end

ActiveRecord::Base.send(:include, ValidatesConstraints)
