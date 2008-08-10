class CreateFieldOfStudies < ActiveRecord::Migration
  def self.up
    create_table :field_of_studies do |t|
      t.string :name, :length => 64, :null => false
      t.string :abbreviation, :length => 4, :null => false
      t.text :description
      t.timestamps
    end
  end

  def self.down
    drop_table :field_of_studies
  end
end
