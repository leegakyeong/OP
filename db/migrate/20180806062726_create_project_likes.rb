class CreateProjectLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :project_likes do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
