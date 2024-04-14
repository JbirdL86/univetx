class RemoveAnimalIdFromSpecies < ActiveRecord::Migration[7.1]
  def change
    remove_column :species, :animal_id
  end
end
