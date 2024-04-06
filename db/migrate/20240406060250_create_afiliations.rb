class CreateAfiliations < ActiveRecord::Migration[7.1]
  def change
    create_table :afiliations do |t|
      t.integer :college_id
      t.integer :client_id

      t.timestamps
    end
  end
end
