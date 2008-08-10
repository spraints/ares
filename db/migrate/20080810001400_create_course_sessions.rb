class CreateCourseSessions < ActiveRecord::Migration
  def self.up
    create_table :course_sessions do |t|
      t.references :acaedmy_session, :null => false
      t.references :course, :null => false
      t.string :section_number, :length => 1
      t.string :note, :length => 1024
      t.text :syllabus
      t.timestamps
    end
  end

  def self.down
    drop_table :course_sessions
  end
end
