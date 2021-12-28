class ChangeMaxGuestInListings < ActiveRecord::Migration[6.1]
  def change
    rename_column :listings, :max_guest, :max_guests
  end
end
