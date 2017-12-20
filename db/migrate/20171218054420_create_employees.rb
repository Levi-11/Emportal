class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :gender
      t.string :designation
      t.string :phone
      t.string :email
      t.date :date_of_join
      t.string :address
      t.boolean :active
      t.string :username
      t.string :personal_email
      t.date :date_of_birth

      t.timestamps
    end
  end
end
