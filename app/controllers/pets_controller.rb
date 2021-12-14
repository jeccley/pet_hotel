class PetsController < ApplicationController
  before_action :set_customer
  before_action :set_pet, only: %i[show edit update destroy]

  def new
    @pet = @customer.pets.build
  end

  def create
    @pet = @customer.pets.build(pet_params)

    if @pet.save
      flash[:notice] = 'Pet has been created.'
      redirect_to [@customer, @pet]
    else
      flash[:alert] = 'Pet has not been created.'
      render 'new'
    end
  end

  def show; end

  private

  def set_customer
    @customer = Customer.find(params[:customer_id])
  end

  def set_pet
    @pet = @customer.pets.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, :animal, :vaccinated, :status)
  end
end
