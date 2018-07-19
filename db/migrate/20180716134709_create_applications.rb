class CreateApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :applications do |t|
      t.belongs_to :user, null: false
      t.belongs_to :project, null: false

      t.timestamps
    end
  end
end
