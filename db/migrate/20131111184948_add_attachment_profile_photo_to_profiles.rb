class AddAttachmentProfilePhotoToProfiles < ActiveRecord::Migration
  def self.up
    change_table :profiles do |t|
      t.attachment :profile_photo
    end
  end

  def self.down
    drop_attached_file :profiles, :profile_photo
  end
end
