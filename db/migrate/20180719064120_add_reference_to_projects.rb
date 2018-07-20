class AddReferenceToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :reference, :string
  end
end
