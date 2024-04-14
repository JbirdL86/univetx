class AddGenderToAnimals < ActiveRecord::Migration[7.1]
  def change
    add_column :animals, :gender, :string
  end
end
