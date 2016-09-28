class AddAttachmentImageToKimonos < ActiveRecord::Migration
  def self.up
    change_table :kimonos do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :kimonos, :image
  end
end
