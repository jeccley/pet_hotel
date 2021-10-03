class BookingsController < ApplicationController
  def index
  end
  
  def show
    @booking = Booking.find(params[:id])
  end
  
  def new
    @booking = Booking.new
  end
  
  def create
    @booking = Booking.new(booking_params)
    
    if @booking.save
      redirect_to @booking, notice: "Booking has been created."
    else
    end
  end
  
  private
  
  def booking_params
    params.require(:booking).permit(:name, :drop_off, :pick_up)
  end
end