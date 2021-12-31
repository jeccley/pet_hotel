class BookedPetsController < ApplicationController
  before_action :set_customer
  before_action :set_booking
  before_action :set_pet, only: %i[destroy]

  def create
    @booking.booked_pets.create(pet_id: params[:format])
    redirect_to [@customer, @booking]
  end

  def destroy
    booked_pet = @booking.booked_pets.find_by(pet_id: params[:id])
    booked_pet.destroy
    redirect_to [@customer, @booking]
  end

  private

  def booked_pet_params
    params.require(:booked_pet).permit
  end

  def set_customer
    @customer = Customer.find(params[:customer_id])
  end

  def set_booking
    @booking = @customer.bookings.find(params[:booking_id])
  end

  def set_pet
    @pet = @customer.pets.find(params[:id])
  end
end
