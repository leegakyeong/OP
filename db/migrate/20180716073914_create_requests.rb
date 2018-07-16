class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.belongs_to :requester, null: false, foreign_key: { to_table: :users } 
      t.belongs_to :requestee, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
