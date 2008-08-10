class CreateAssignments < ActiveRecord::Migration
  def self.up
    create_table :assignments do |t|
      t.references :course_session, :null => false
      t.string :name, :length => 255, :null => false
      t.text :description
      t.integer :maximum_points, :null => false
      t.date :due_date
      t.timestamps
    end
  end

  def self.down
    drop_table :assignments
  end
end
