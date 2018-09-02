class CreateVertices < ActiveRecord::Migration[5.2]
  def change
    create_table :vertices do |t|
      t.integer :x
      t.integer :y
      t.belongs_to :polygon, index: true
      t.timestamps
    end
  end
end
