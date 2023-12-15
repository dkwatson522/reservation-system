module Api::V1
  class CustomersController < ApplicationController
    protect_from_forgery unless: -> {request.format.json?}
    before_action :set_customer, only: [:show, :destroy, :update]

    def index
      customers = Customer.order('first_name');
      render json: {status: 'SUCCESS', message: 'Loaded all customers', data: customers}, status: :ok
    end

    def show
      # customer = Customer.find(params[:id])
      render json: {status: 'SUCCESS', message: 'Loaded customer', data: @customer}, status: :ok
    end

    def create
      customer = Customer.new(customer_params);

      if customer.save
        render json: {status: 'SUCCESS', message: 'Saved customer', data: customer}, status: :ok
      else
        render json: {status: 'ERROR', message: 'Customer not saved', data: customer.errors}, status: :unprocessable_entity
      end
    end

    def destroy
      # customer = Customer.find(params[:id]);
      @customer.destroy;

      render json: {status: 'SUCCESS', message: 'Deleted customer', data: @customer}, status: :ok
    end

    def update
      # customer = Customer.find(params[:id]);

      if @customer.update(customer_params)
        render json: {status: 'SUCCESS', message: 'Updated customer', data: @customer}, status: :ok
      else
        render json: {status: 'ERROR', message: 'Customer not updated', data: @customer.errors}, status: :unprocessable_entity
      end
    end

    private

    def set_customer
      @customer = Customer.find(params[:id])
    end

    def customer_params
      params.require(:customer).permit(
        :first_name,
        :last_name,
        :email
      )
    end

  end
end
