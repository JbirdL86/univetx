class CreateSpecies < ActiveRecord::Migration[7.1]
  def change
    create_table :species do |t|
      t.string :species
      t.integer :animal_id

      t.timestamps
    end
  end
end
