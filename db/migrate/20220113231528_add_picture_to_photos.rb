class AddPictureToPhotos < ActiveRecord::Migration[7.0]
  def change
    add_column :photos, :image_data, :text
  end
end
