class AddPictureToEmployees < ActiveRecord::Migration[5.1]
  def change
    add_column :employees, :picture, :string
  end
end
