# == Schema Information
#
# Table name: reservations
#
#  id                       :integer          not null, primary key
#  listing_id               :integer          not null
#  guest_id                 :integer          not null
#  session_id               :string
#  status                   :integer          default("0")
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  stripe_payment_intent_id :string
#  stripe_refund_id         :string
#
# Indexes
#
#  index_reservations_on_guest_id    (guest_id)
#  index_reservations_on_listing_id  (listing_id)
#

class Reservation < ApplicationRecord
  belongs_to :listing
  belongs_to :guest, class_name: 'User'
  enum status: { pending: 0, booked: 1, cancelled: 2, canceling: 3 }
end
