class AddTypeToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :type, :string
  end
end
