class FixAfiliationColumn < ActiveRecord::Migration[7.1]
  def change
    rename_column :afiliations, :college_id, :vet_id
  end
end
