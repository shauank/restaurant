class AddAttachmentPhotoToDetails < ActiveRecord::Migration
  def self.up
    change_table :details do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :details, :photo
  end
end
