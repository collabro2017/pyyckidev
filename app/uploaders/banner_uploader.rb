# encoding: utf-8

class BannerUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  def default_url(*args)
    puts 
    ActionController::Base.helpers.asset_path(["cover.jpg"].compact.join('_'))
  end

  cloudinary_transformation :angle => :auto

  # Create different versions of your uploaded files:
  version :wide do
    process :resize_to_fill => [1000, 250]
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
