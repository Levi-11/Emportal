class AddIndexToEmployeesEmail < ActiveRecord::Migration[5.1]
  def change
    add_index :employees, :email, unique: true
  end
end
