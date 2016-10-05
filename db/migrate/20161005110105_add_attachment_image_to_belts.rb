class AddAttachmentImageToBelts < ActiveRecord::Migration
  def self.up
    change_table :belts do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :belts, :image
  end
end
