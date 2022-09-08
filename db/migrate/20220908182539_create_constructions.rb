class CreateConstructions < ActiveRecord::Migration[6.1]
  def change
    create_table :constructions do |t|
      t.string :description
      t.integer :client_id
      t.integer :project_manager_id
    end
  end
end
