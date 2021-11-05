class PetsController < ApplicationController
  before_action :set_booking
  before_action :set_pet, only: %i[show edit update destroy]

  def new
    @pet = @booking.pets.build
  end

  def create
    @pet = @booking.pets.build(pet_params)

    if @pet.save
      flash[:notice] = 'Pet has been created.'
      redirect_to [@booking, @pet]
    else
      flash[:alert] = 'Pet has not been created.'
      render 'new'
    end
  end

  def show; end

  private

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

  def set_pet
    @pet = @booking.pets.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, :animal, :vaccinated)
  end
end
