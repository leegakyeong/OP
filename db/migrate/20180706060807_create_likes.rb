class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.belongs_to :user, null: false
      t.belongs_to :project, null: false

      t.timestamps
    end
  end
end
