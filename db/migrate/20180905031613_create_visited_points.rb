class CreateVisitedPoints < ActiveRecord::Migration[5.2]
  def change
    create_table :visited_points do |t|
      t.belongs_to :execution, index: true
      t.integer :x
      t.integer :y
    end
  end
end
