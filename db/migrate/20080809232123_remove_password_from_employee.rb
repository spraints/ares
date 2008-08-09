class RemovePasswordFromEmployee < ActiveRecord::Migration
  def self.up
    remove_column :employees, :crypted_password
  end

  def self.down
    add_column :employees, :crypted_password,          :string, :limit => 40
  end
end
