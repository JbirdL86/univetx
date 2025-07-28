class AddCastratedToAnimals < ActiveRecord::Migration[7.1]
  def change
    add_column :animals, :castrated, :string
  end
end
