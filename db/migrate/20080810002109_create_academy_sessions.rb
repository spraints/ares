class CreateAcademySessions < ActiveRecord::Migration
  def self.up
    create_table :academy_sessions do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :academy_sessions
  end
end
