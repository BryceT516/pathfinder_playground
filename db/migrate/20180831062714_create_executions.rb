class CreateExecutions < ActiveRecord::Migration[5.2]
  def change
    create_table :executions do |t|
      t.belongs_to :map, index: true
      t.belongs_to :agent, index: true
      t.integer :agent_current_x
      t.integer :agent_current_y
      t.float :agent_current_cost
      t.timestamps
    end
  end
end
