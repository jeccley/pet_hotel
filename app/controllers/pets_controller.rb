# frozen_string_literal: true

class PetsController < ApplicationController
  before_action :set_customer
  before_action :set_pet, only: %i[show edit update destroy]

  def new
    @pet = @customer.pets.build
  end

  def create
    @pet = @customer.pets.build(pet_params)
    @pet.author = current_user

    if @pet.save
      flash[:notice] = 'Pet has been created.'
      redirect_to [@customer, @pet]
    else
      flash[:alert] = 'Pet has not been created.'
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @pet.update(pet_params)
      redirect_to [@customer, @pet], notice: 'Pet has been updated.'
    else
      flash.now[:alert] = 'Pet has not been updated.'
      render 'edit'
    end
  end

  def destroy
    @pet.destroy
    redirect_to @customer, notice: 'Pet has been deleted.'
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :animal, :vaccinated, :status, :notes)
  end

  def set_customer
    @customer = Customer.find(params[:customer_id])
  end

  def set_pet
    @pet = @customer.pets.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'The pet you were looking for could not be found.'
    redirect_to customer_pets_path(@customer)
  end
end
