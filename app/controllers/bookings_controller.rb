class BookingsController < ApplicationController
  # everything will need authorisation
  def index
    # authorisation required x2 (listing made and listing wanted)
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @listing = Listing.find(params[:id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to @booking
    else
      render :new, status: :unprocessable_entity
    end
  end

  def back
    redirect_back(fallback_location: root_path)
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      # if @booking.state == "approved"
        # flash[:success] = "Booking successfully approved"
       redirect_to bookings_path
    else
      # render # where was the booking update form?
      # flash[:error] = "Booking not approved"
      render :show
    end
  end


  private

  def booking_params
    params.require(:booking).permit(:status, :rent_start, :rent_end, :total_price)
  end
end


  # def approve
    # @booking = Booking.find_by_id(params[:id])
     # @booking.update(state: "approved")
    #  if @booking.state == "approved"
    #    flash[:success] = "Booking successfully approved"
    #    redirect_to bookings_path
    #  else
    #    flash[:error] = "Booking not approved"
    #    redirect_to bookings_path
    #  end
