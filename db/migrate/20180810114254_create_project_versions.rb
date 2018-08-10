class CreateProjectVersions < ActiveRecord::Migration[5.1]
  def change
    create_table :project_versions do |t|

      t.timestamps
    end
  end
end
