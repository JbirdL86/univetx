class RemoveTypeIdFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :vet_id, :integer
    remove_column :users, :client_id, :integer
  end
end
