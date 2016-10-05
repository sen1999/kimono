class Kimono < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "100x100 >", thumb: "100x100>"}
  validates_attachment_content_type :image, content_type: ["image/jpg","image/jpeg","image/png","image/gif"]

  acts_as_ordered_taggable_on :kinds, :uses
end
