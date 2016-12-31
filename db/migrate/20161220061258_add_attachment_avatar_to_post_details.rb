class AddAttachmentAvatarToPostDetails < ActiveRecord::Migration
  def self.up
    change_table :post_details do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :post_details, :avatar
  end
end
