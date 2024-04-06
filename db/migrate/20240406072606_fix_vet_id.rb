class FixVetId < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :college_id, :vet_id
  end
end
