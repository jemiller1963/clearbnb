class Host::ListingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @listings = current_user.listing.all
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = current_user.listing.new(listing_create_params)
    if @listing.save
      redirect_to host_listing_path(@listing)
    else
      flash.now[:errors] = @listing.errors.full_messages
      render :new
    end
  end

  def show
    @listing = current_user.listing.find(params[:id])
  end

  def edit
    @listing = current_user.listing.find(params[:id])
  end

  def update
    @listing = current_user.listing.find(params[:id])
    if @listing.update(listing_update_params)
      redirect_to host_listing_path(@listing)
    else
      flash.now[:errors] = @listing.errors.full_messages
      render :edit
    end
  end


  def destroy
    @listing = current_user.listing.find(params[:id])
    @listing.update(status: :archived)
    redirect_to host_listing_path
  end

  private

  def listing_create_params
    params.require(:listing).permit(
      :title,
      :about,
      :max_guests,
      :address_line1,
      :address_line2,
      :city,
      :state,
      :postal_code,
      :country,
      :lat,
      :lng
    )
  end

  def listing_update_params
    params.require(:listing).permit(
      :title,
      :about,
      :max_guests,
      :status,
    )
  end
end
