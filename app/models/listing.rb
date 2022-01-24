# == Schema Information
#
# Table name: listings
#
#  id                :integer          not null, primary key
#  host_id           :integer          not null
#  title             :string           not null
#  about             :text
#  max_guests        :integer          default("1")
#  address_line1     :string
#  address_line2     :string
#  city              :string
#  state             :string
#  postal_code       :string
#  country           :string
#  lat               :decimal(10, 6)
#  lng               :decimal(10, 6)
#  status            :integer          default("0")
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  nightly_price     :integer
#  cleaning_fee      :integer
#  stripe_product_id :string
#
# Indexes
#
#  index_listings_on_host_id  (host_id)
#

class Listing < ApplicationRecord
  validates :title, presence: true
  validates :max_guests, numericality: { greater_than: 0, less_than_or_equel_to: 100 }
  validates :nightly_price, numericality: { greater_than: 0 }
  validates :cleaning_fee, numericality: { greater_than: 0 }
  belongs_to :host, class_name: 'User'
  has_many :rooms
  has_many :photos

  enum status: { draft: 0, published: 1, archived: 2 }

  scope :published, -> { where(status: :published )}


  after_commit :maybe_create_stripe_product, on: [:create, :update]

  def maybe_create_stripe_product
    return if !stripe_product_id.blank?

    product = Stripe::Product.create(
      name: title,
      url: Rails.application.routes.url_helpers.url_for(self),
      metadata: {
        clearbnb_id: id,
      }
    )
    self.update(stripe_product_id: product.id)
  end



end

