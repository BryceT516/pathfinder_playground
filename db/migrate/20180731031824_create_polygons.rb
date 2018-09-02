class CreatePolygons < ActiveRecord::Migration[5.2]
  def change
    create_table :polygons do |t|
      t.string :designation
      t.integer :vertex_count
      t.belongs_to :map, index: true
      t.timestamps
    end
  end
end
