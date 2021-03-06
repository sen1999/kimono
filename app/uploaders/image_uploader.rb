# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

process convert: :png

def filename
  "#{original_filename.split('.').first}.png" if original_filename
end

def cache_name
  File.join(cache_id, [version_name, filename].compact.join('_')) if cache_id and original_filename
end

version :thumb do
  process :round_image
  # process :resize_to_limit => [100, 100]
end

version :detail do
  process :round_image
  # process :resize_to_limit => [300, 300]
end

private

def round_image
  manipulate! do |img|

    path = img.path

    new_tmp_path = File.join(Rails.root, 'public', cache_dir, "/round_#{File.basename(path)}")

    width, height = img[:dimensions]

    radius_point = ((width > height) ? [width / 2, height] : [width, height / 2]).join(',')

    imagemagick_command = ['convert',
                         "-size #{ width }x#{ height }",
                         'xc:transparent',
                         "-fill #{ path }",
                         "-draw 'circle #{ width / 2 },#{ height / 2 } #{ radius_point }'",
                         "+repage #{new_tmp_path}"].join(' ')

    system(imagemagick_command)
    MiniMagick::Image.open(new_tmp_path)
  end
  # def filename
  #   "#{Time.now.strftime('%Y%m%d%H%M%S')}.jpg" if original_filename.present?
  # end



  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :crop
  #   process :resize_to_limit => [100, 100]
  # end

  # version :detail do
  #   process :crop
  #   process :resize_to_limit => [300, 300]
  # end

  # def crop
  #   manipulate! do |img|
  #     gravity = Magick::CenterGravity # 中央から切り取ります。
  #     crop_w = img.columns
  #     crop_h = img.rows
  #     # 画像のサイズが縦横違った場合は小さい方に合わせてトリミングする。
  #     if img.rows <= img.columns
  #       crop_w = img.rows
  #     else
  #       crop_h = img.columns
  #     end
  #     img.crop!(gravity, crop_w, crop_h)
  #     img = yield(img) if block_given?
  #     img
  #   end
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
end
end
