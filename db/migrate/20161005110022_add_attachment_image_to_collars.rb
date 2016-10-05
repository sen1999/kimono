class AddAttachmentImageToCollars < ActiveRecord::Migration
  def self.up
    change_table :collars do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :collars, :image
  end
end
