class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.string :client_name
      t.integer :project_type
      t.integer :manager_id
     
      t.timestamps
    end
  end
end
