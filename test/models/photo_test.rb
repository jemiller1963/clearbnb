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

require "test_helper"

class PhotoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
