class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      # t.belongs_to :user
      t.integer :admin_id, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
