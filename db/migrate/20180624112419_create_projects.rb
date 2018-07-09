class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      # t.belongs_to :user
      t.integer  :admin_id, foreign_key: true
      t.string   :title
      t.integer  :maxMember
      t.string   :skills
      t.string   :description
      t.boolean  :isKorean
      t.boolean  :isOnline
      t.string   :tools
      t.string   :files
      t.string   :tags

      t.timestamps
    end
  end 
end
