class CreateFrontierPoints < ActiveRecord::Migration[5.2]
  def change
    create_table :frontier_points do |t|
      t.belongs_to :execution, index: true
      t.integer :x
      t.integer :y
      t.float :distance_to_goal
      t.float :cost
      t.float :total_cost
      t.float :h_score
    end
  end
end
