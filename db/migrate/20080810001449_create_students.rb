class CreateStudents < ActiveRecord::Migration
  def self.up
    create_table :students do |t|
      t.references :employee, :null => false
      t.references :course_session, :null => false
      t.string :final_letter_grade, :length => 2
      t.text :notes
      t.timestamps
    end
  end

  def self.down
    drop_table :students
  end
end
