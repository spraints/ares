class CreateScores < ActiveRecord::Migration
  def self.up
    create_table :scores do |t|
      t.references :assignment, :null => false
      t.references :student, :null => false
      t.integer :points
      t.timestamps
    end
  end

  def self.down
    drop_table :scores
  end
end
