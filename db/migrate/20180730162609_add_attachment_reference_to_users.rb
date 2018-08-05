class AddAttachmentReferenceToUsers < ActiveRecord::Migration[5.1]
  def self.up
    change_table :users do |t|
      t.attachment :reference
    end
  end

  def self.down
    remove_attachment :users, :reference
  end
end
