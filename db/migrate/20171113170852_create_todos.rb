class CreateTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :todos do |t|
      t.string :name
      t.integer :complexity
      t.integer :estimated_time
      t.integer :status
      t.references :project
      t.integer :developer_id
      t.timestamps
    end
  end
end
