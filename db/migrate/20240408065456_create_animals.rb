class CreateAnimals < ActiveRecord::Migration[7.1]
  def change
    create_table :animals do |t|
      t.string :name
      t.integer :age
      t.string :breed
      t.string :color
      t.bigint :chip_number
      t.integer :species_id

      t.timestamps
    end
  end
end
