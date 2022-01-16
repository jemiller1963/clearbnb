class Photo < ApplicationRecord
  belongs_to :listing
  # has_one_attached :picture
  include ImageUploader::Attachment(:image)

end
