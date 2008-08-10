class CreateAcademySessions < ActiveRecord::Migration
  def self.up
    create_table :academy_sessions do |t|
      t.string :name, :length => 255, :null => false
      t.date :start, :end

      t.timestamps
    end
  end

  def self.down
    drop_table :academy_sessions
  end
end
