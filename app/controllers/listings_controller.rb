class ListingsController < ApplicationController
  def index
    @listings = Listing.all
  end

  def show
    @listing = Listing.find(params[:id])
    @bookmark = Bookmark.new
  end

  def new
    @listing = listing.new
  end

  def create
    @listing = listing.new(listing_params)
    if @listing.save
      redirect_to @listing
    end
   # else
     # render :new, status: :unprocessable_entity
  end
end
