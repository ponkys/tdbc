class AddAttachmentThumbnailToAdmins < ActiveRecord::Migration
  def self.up
    change_table :admins do |t|
      t.attachment :thumbnail
    end
  end

  def self.down
    remove_attachment :admins, :thumbnail
  end
end
