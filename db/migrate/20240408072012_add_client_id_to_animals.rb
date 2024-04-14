class AddClientIdToAnimals < ActiveRecord::Migration[7.1]
  def change
    add_column :animals, :client_id, :integer
  end
end
