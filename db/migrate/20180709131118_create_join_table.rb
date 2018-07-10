class CreateJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :projects, :tags do |t|
      t.index [:project_id, :tag_id]
      t.index [:tag_id, :project_id]
    end
  end
end

# https://teamtreehouse.com/library/has-and-belongs-to-many-associations 
# project.tags << Tag.find(1)