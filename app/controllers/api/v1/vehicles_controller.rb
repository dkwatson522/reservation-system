module Api::V1
  class VehiclesController < ApplicationController
    before_action :set_customer, only: [:index]
    before_action :set_customer_vehicle, only: [:show, :destroy, :update]
    # allows JSON requests
    protect_from_forgery unless: -> {request.format.json?}

    def index
      vehicles = @customer.vehicles;
      render json: {status: 'SUCCESS', message: 'Loaded customer\'s vehicles', data: vehicles}, status: :ok
    end

    def show
      @vehicle
      render json: {status: 'SUCCESS', message: 'Loaded vehicle', data: @vehicle}, status: :ok
    end

    def create
      vehicle = Vehicle.new(vehicle_params);

      if vehicle.save
        render json: {status: 'SUCCESS', message: 'Saved vehicle', data: vehicle}, status: :ok
      else
        render json: {status: 'ERROR', message: 'Vehicle not saved', data: vehicle.errors}, status: :unprocessable_entity
      end
    end

    def destroy
      @vehicle;
      @vehicle.destroy;

      render json: {status: 'SUCCESS', message: 'Deleted vehicle', data: @vehicle}, status: :ok
    end

    def update
      @vehicle;

      if @vehicle.update(vehicle_params)
        render json: {status: 'SUCCESS', message: 'Updated vehicle', data: @vehicle}, status: :ok
      else
        render json: {status: 'ERROR', message: 'Vehicle not updated', data: vehicle.errors}, status: :unprocessable_entity
      end
    end

    private

    def vehicle_params
      params.require(:vehicle).permit(
        :model,
        :make,
        :year,
        :mileage,
        :license_plate,
        # required
        :customer_id
      )
    end

    def set_customer
      @customer = Customer.find(params[:customer_id])
    end

    def set_customer_vehicle
      @vehicle = Vehicle.find(params[:id])
    end
  end
end
