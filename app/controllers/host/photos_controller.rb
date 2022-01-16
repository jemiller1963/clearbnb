class Host::PhotosController < ApplicationController
  before_action :authenticate_user!

  def index
    @listing = current_user.listings.find(params[:listing_id])
    @photo = @listing.photos
  end

  def new
    @photo = Photo.new
  end

  def create
    @listing = current_user.listings.find(params[:listing_id])
    @photo = @listing.photos.build(photo_params)
    if @photo.save
      redirect_to host_listing_photos_path(@listing)
    else
      flash[:errors] = @photo.errors.full_messages
    end
  end

  def destroy
    @photo = @photo.find(params[:id])
    @photo.destroy
    render json: {}
  end

  private

  def photo_params
    params.require(:photo).permit(:caption, :image)
  end
end
