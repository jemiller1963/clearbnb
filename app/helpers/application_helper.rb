module ApplicationHelper
  def address(listing)
    "#{listing.address_line1}, #{listing.address_line2}, #{listing.city}, #{listing.state}"
  end
end
