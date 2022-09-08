class CreateProjectManagers < ActiveRecord::Migration[6.1]
  def change
    create_table :project_managers do |t|
      t.string :name
      t.integer :age
      t.integer :experience
    end
  end
end
