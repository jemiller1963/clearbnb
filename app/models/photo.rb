# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  listing_id :integer          not null
#  caption    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  image_data :text
#
# Indexes
#
#  index_photos_on_listing_id  (listing_id)
#

class Photo < ApplicationRecord
  belongs_to :listing
  # has_one_attached :picture
  include ImageUploader::Attachment(:image)

end
