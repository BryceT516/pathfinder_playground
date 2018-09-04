class CreateMaps < ActiveRecord::Migration[5.2]
  def change
    create_table :maps do |t|
      t.string :description
      t.integer :width
      t.integer :height

      t.timestamps
    end
  end
end
