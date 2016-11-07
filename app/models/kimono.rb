class Kimono < ActiveRecord::Base


  mount_uploader :image, ImageUploader


  acts_as_ordered_taggable_on :uses
end
