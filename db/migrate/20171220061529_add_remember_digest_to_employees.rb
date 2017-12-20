class AddRememberDigestToEmployees < ActiveRecord::Migration[5.1]
  def change
    add_column :employees, :remember_digest, :string
  end
end
