class CreateCourses < ActiveRecord::Migration
  def self.up
    create_table :courses do |t|
      t.references :field_of_study, :null => false
      t.string :name, :length => 64, :null => false
      t.string :number, :length => 3, :null => false
      t.text :description
      t.text :syllabus
      t.timestamps
    end
  end

  def self.down
    drop_table :courses
  end
end
