class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
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
      redirect_to @booking, notice: 'Booking has been created.'
    else
      flash.now[:alert] = 'Booking has not been created.'
      render 'new'
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])

    if @booking.update(booking_params)
      redirect_to @booking, notice: 'Booking has been updated.'
    else
      flash.now[:alert] = 'Booking has not been updated.'
      render 'edit'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:name, :drop_off, :pick_up)
  end
end
