class CreateMaps < ActiveRecord::Migration[5.2]
  def change
    create_table :maps do |t|
      t.string :description
      t.integer :width
      t.integer :height
      t.integer :start_point_x
      t.integer :start_point_y
      t.integer :end_point_x
      t.integer :end_point_y
      t.timestamps
    end
  end
end
