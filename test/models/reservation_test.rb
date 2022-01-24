# == Schema Information
#
# Table name: reservations
#
#  id         :integer          not null, primary key
#  listing_id :integer          not null
#  guest_id   :integer          not null
#  session_id :string
#  status     :integer          default("0")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_reservations_on_guest_id    (guest_id)
#  index_reservations_on_listing_id  (listing_id)
#

require "test_helper"

class ReservationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
