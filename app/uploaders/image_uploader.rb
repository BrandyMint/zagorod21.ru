# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
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

  # Create different versions of your uploaded files:
  version :standard do
    process :resize_to_fit => [800, 600]
  end

  version :basic do
    process :resize_to_fill => [171, 180]
  end

  version :common do
    process :resize_to_fill => [360, 200]
  end

  version :thumb do
    process :resize_to_fill => [128, 128]
  end

  version :small do
    process :resize_to_fill => [60, 60]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
  #
  def geometry
    return @geometry if @geometry

    # Если вы в загрузке использовать загружаемый файл
    # есть нет, то используем тот что ухе сохранен
    image_file = @file ? @file.file : store_path

    return {} unless image_file

    begin
      i = ::MiniMagick::Image.open(image_file)
      @geometry = {width: i[:width], height: i[:height]}
    rescue
      # Возможны ошибки с открытием файла
      @geometry = {width: 0, height: 0}
    end
  end

  def size
    return '' if geometry.empty?
    "#{width}x#{height}"
  end

  def width
    geometry[:width]
  end

  def height
    geometry[:height]
  end

end
