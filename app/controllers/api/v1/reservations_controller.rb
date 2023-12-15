module Api::V1
  class ReservationsController < ApplicationController
    before_action :set_customer, only: [:index]
    before_action :set_customer_reservation, only: [:show, :destroy, :update]
    # allows JSON requests
    protect_from_forgery unless: -> {request.format.json?}

    def index
      reservations = @customer.reservations;
      render json: {status: 'SUCCESS', message: 'Loaded reservations', data: reservations}, status: :ok
    end

    def show
      @reservation
      render json: {status: 'SUCCESS', message: 'Loaded reservation', data: @reservation}, status: :ok
    end

    def create
      reservation = Reservation.new(reservation_params);

      if reservation.save
        render json: {status: 'SUCCESS', message: 'Saved reservation', data: reservation}, status: :ok
      else
        render json: {status: 'ERROR', message: 'Reservation not saved', data: reservation.errors}, status: :unprocessable_entity
      end
    end

    def destroy
      @reservation.destroy;

      render json: {status: 'SUCCESS', message: 'Deleted reservation', data: @reservation}, status: :ok
    end

    def update
      @reservation;

      if @reservation.update(reservation_params)
        render json: {status: 'SUCCESS', message: 'Updated reservation', data: @reservation}, status: :ok
      else
        render json: {status: 'ERROR', message: 'Reservation not updated', data: @reservation.errors}, status: :unprocessable_entity
      end
    end

    private

    def reservation_params
      params.require(:reservation).permit(
        # :start_date,
        # :end_date,
        :time_slot,
        :issue,
        :completed,
        # required
        :customer_id,
        # required
        :vehicle_id
      )
    end


    def set_customer
      @customer = Customer.find(params[:customer_id])
    end

    def set_customer_reservation
      @reservation = Reservation.find(params[:id])
    end
  end
end
