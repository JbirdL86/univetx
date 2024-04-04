class AddDefaultFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :last_name, :string
    add_column :users, :address, :string
    add_column :users, :college_id, :integer
    add_column :users, :speciality, :string
    add_column :users, :country, :string
    add_column :users, :city, :string
  end
end
