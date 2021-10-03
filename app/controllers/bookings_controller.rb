class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit update destroy]

  def index
    @bookings = Booking.all
  end

  def show; end

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

  def edit; end

  def update
    if @booking.update(booking_params)
      redirect_to @booking, notice: 'Booking has been updated.'
    else
      flash.now[:alert] = 'Booking has not been updated.'
      render 'edit'
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path, notice: 'Booking has been deleted.'
  end

  private

  def booking_params
    params.require(:booking).permit(:name, :drop_off, :pick_up)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'The booking you were looking for could not be found.'
    redirect_to bookings_path
  end
end
