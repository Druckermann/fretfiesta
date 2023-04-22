class ListingsController < ApplicationController
  # skip_before_action :authenticate_user!, only:[:index, :show]
  before_action :set_listing, only: %i[show destroy edit]

  def index
    @listings = Listing.all
    if params[:search].present?
      search_term = params[:search].downcase
      @listings = @listings.where("lower(name) LIKE ?", "%#{search_term}%")
    end
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    if @listing.save
      redirect_to @listing
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @listing = Listing.find(params[:id])
    @listing.update(listing_params)
    redirect_to listing_path(@listing)
  end

  def destroy
    @listing.destroy
    redirect_to_listings_path
  end

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:photo, :name, :category, :price, :description, :location, :rating)
  end
end
