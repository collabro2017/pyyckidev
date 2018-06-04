# encoding: utf-8

class LogoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  def default_url(*args)
    ActionController::Base.helpers.asset_path(["avatar-fallback.jpg"].compact.join('_')) ## TODO update this
  end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  cloudinary_transformation :angle => :auto

  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  version :thumb do
    process :resize_to_fit => [50, 50]
  end

  version :square do
    process :resize_to_fill => [200, 200]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
end
