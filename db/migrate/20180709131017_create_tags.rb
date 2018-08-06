class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.references  :project, index: true, foreign_key: true
      t.string      :content

      t.timestamps
    end
  end
end
