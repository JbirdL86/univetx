class AddSpecialityToAfiliation < ActiveRecord::Migration[7.1]
  def change
    add_column :afiliations, :speciality, :string
  end
end
