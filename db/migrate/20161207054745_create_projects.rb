class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :client
      t.boolean :archived, null: false, default: false

      t.timestamps
    end
  end
end
