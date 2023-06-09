class BookingsController < ApplicationController
  # everything will need authorisation

  before_action :set_listing, only: [:create]
  # AT: Setup to get second create method working:
  # before_action :set_listing, except: [:create]

  # AT: Advanced index:
  def index
    @outgoing_bookings = Booking.where(user: current_user)
    @incoming_bookings = Booking.includes(:listing).where(listing: { user: current_user })
  end

  #  AT: Index working with basic approval:
  # def index
  #   # authorisation required x2 (listing made and listing wanted)
  #   @bookings = Booking.all
  # end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    puts "Initiating a booking..."
    puts "Listing ID: #{params[:listing_id]}"
    @booking = Booking.new
    @listing = Listing.find(params[:listing_id])
  end


  # AT: My fourth method from Thu 20/04
  def create
    puts "Listing: #{@listing}"
    @booking = current_user.bookings.new(booking_params)
    @booking.user = current_user
    @booking.status = "pending"
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def cost
  end
    # ... the full calculation
    # @booking.total_price = cost # Move this bit up into create


  # AT: My third method from Thu 20/04
  # def create
  #   puts "Trying to define @booking..."
  #   @booking = Booking.new(booking_params)
  #   puts "Trying to define @booking.listing..."
  #   @booking.listing = @listing
  #   puts "Trying to define @booking.user..."
  #   @booking.user = current_user
  #   puts "Trying to save @booking..."
  #   if @booking.save
  #     redirect_to booking_path(@booking)
  #   else
  #     puts "Could not save..."
  #     # render :new, status: :unprocessable_entity
  #   end
  # end

  # AT: My second method from Wed 19/04
  # def create
  #   puts "Creating a booking..."
  #   @booking = current_user.bookings.build(booking_params)
  #   @listing = Listing.find(params[:listing_id])
  #   @booking.listing = @listing
  #   @booking.status = "pending"

  #   if @booking.save
  #     flash[:success] = "Booking created!"
  #     redirect_to bookings_path
  #   else
  #     flash[:error] = "There was a problem with your booking. Please try again."
  #     render 'new'
  #   end
  # end

  # AT: My first method from Wed 19/04
  # def create
  #   puts "Creating a booking..."
  #   @booking = current_user.bookings.build(booking_params)
  #   @listing = Listing.find(params[:booking][:listing_id])
  #   @booking.listing = @listing

  #   if @booking.save
  #     flash[:success] = "Booking created!"
  #     redirect_to bookings_path
  #   else
  #     flash[:error] = "There was a problem with your booking. Please try again."
  #     render 'new'
  #   end
  # end

  # Jon's method from Tue 18/04
  # def create
  #   @booking = Booking.new(booking_params)
  #   @booking.user = current_user
  #   @booking.listing = @listing
  #   if @booking.save
  #     redirect_to bookings_path
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end

  def back
    redirect_back(fallback_location: root_path)
  end

  # AT: Approval method from stackoverflow
  def approve
    @booking = Booking.find_by_id(params[:id])
    @booking.update(status: "approved")
    if @booking.status == "approved"
      flash[:success] = "Booking successfully approved"
      redirect_to bookings_path
     else
       flash[:error] = "Booking not approved"
       redirect_to bookings_path
     end
  end

  def decline
    @booking = Booking.find_by_id(params[:id])
    @booking.update(status: "declined")
    if @booking.status == "declined"
      flash[:success] = "Booking declined"
      redirect_to bookings_path
     else
       flash[:error] = "Booking not declined"
       redirect_to bookings_path
    end
  end

  private

  def set_listing
    puts "Listing ID: #{params[:booking][:listing_id]}"
    @listing = Listing.find(params[:booking][:listing_id])
  end

  #  AT: temporary params for testing
  def booking_params
    params.require(:booking).permit(:rent_start, :rent_end, :status, :total_price, :user_id, :listing_id)
  end




end
