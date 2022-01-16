# This is a subclass of Shrine base that will be further configured for it's requirements.
# This will be included in the model to manage the file.
require "image_processing/mini_magick"

class ImageUploader < Shrine
  ALLOWED_TYPES  = %w[image/jpeg image/png image/webp]
  MAX_SIZE       = 5*1024*1024 # 10 MB
  MAX_DIMENSIONS = [5000, 5000] # 5000x5000

  THUMBNAILS = {
    small:  [300, 300],
    medium: [600, 600],
    large:  [800, 800],
  }

  plugin :remove_attachment
  plugin :pretty_location
  plugin :validation_helpers
  plugin :derivatives
  plugin :determine_mime_type, analyzer: :marcel, log_subscriber: nil
  # plugin :store_dimensions, log_subscriber: nil
  # plugin :derivation_endpoint, prefix: "derivations/image"

  # File validations (requires `validation_helpers` plugin)
  Attacher.validate do
    validate_mime_type %w[image/jpeg image/png image/gif image/webp]
    validate_size 0..MAX_SIZE
  end

  # Thumbnails processor (requires `derivatives` plugin)
  Attacher.derivatives do |original|
    magick = ImageProcessing::MiniMagick.source(original)

    { 
      small:  magick.resize_to_limit!(300, 300),
      medium: magick.resize_to_limit!(500, 500),
      large:  magick.resize_to_limit!(800, 800),
    }
  end 
end

