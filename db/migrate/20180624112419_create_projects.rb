class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      # t.belongs_to :user
      t.integer  :admin_id, foreign_key: true, null: false
      t.string   :title, null: false
      t.integer  :maxMember, foreign_key: true
      t.string   :skills
      t.string   :description, null: false
      t.boolean  :isKorean, foreign_key: true
      t.boolean  :isOnline, foreign_key: true
      t.string   :tools
      t.string   :tag_string
      t.references  :tag, index: true, foreign_key: true
      t.boolean  :isClosed, foreign_key: true

      t.timestamps  
    end
  end 
end
