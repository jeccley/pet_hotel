# frozen_string_literal: true

class BookingsController < ApplicationController
  before_action :set_customer
  before_action :set_booking, only: %i[show edit update destroy]

  def show; end

  def new
    @booking = @customer.bookings.build
  end

  def create
    @booking = @customer.bookings.build(booking_params)
    @booking.author = current_user

    if @booking.save
      redirect_to [@customer, @booking], notice: 'Booking has been created.'
    else
      flash.now[:alert] = 'Booking has not been created.'
      render 'new'
    end
  end

  def edit; end

  def update
    if @booking.update(booking_params)
      redirect_to [@customer, @booking], notice: 'Booking has been updated.'
    else
      flash.now[:alert] = 'Booking has not been updated.'
      render 'edit'
    end
  end

  def destroy
    @booking.destroy
    redirect_to @customer, notice: 'Booking has been deleted.'
  end

  private

  def booking_params
    params.require(:booking).permit(:drop_off, :pick_up, :notes)
  end

  def set_customer
    @customer = Customer.find(params[:customer_id])
  end

  def set_booking
    @booking = @customer.bookings.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'The booking you were looking for could not be found.'
    redirect_to customer_bookings_path(@customer)
  end
end
