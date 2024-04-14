class AddWeightToAnimals < ActiveRecord::Migration[7.1]
  def change
    add_column :animals, :weight, :float
  end
end
