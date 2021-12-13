class CustomersController < ApplicationController
  before_action :set_customer, only: %i[show edit update destroy]

  def index
    @customers = Customer.all
  end

  def show; end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      redirect_to @customer, notice: 'Customer has been created.'
    else
      flash.now[:alert] = 'Customer has not been created.'
      render 'new'
    end
  end

  def edit; end

  def update
    if @customer.update(customer_params)
      redirect_to @customer, notice: 'Customer has been updated.'
    else
      flash.now[:alert] = 'Customer has not been updated.'
      render 'edit'
    end
  end

  def destroy
    @customer.destroy
    redirect_to customers_path, notice: 'Customer has been deleted.'
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'The Customer you were looking for could not be found.'
    redirect_to customers_path
  end

  def customer_params
    params.require(:customer).permit(:name, :phone, :email, :notes, :vet_details)
  end
end
