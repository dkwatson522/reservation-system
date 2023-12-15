module Api::V1
  class TimeSlotsController < ApplicationController
    before_action :available_slots

    def index
      render json: {status: 'SUCCESS', message: 'Loaded available time slots', data: @available_time_slots}, status: :ok
    end

    private
    def available_slots
      # assuming no same day booking
      first_available_to_book = Chronic.parse("tomorrow at 10AM");
      # assuming last available day to book is in 2 weeks
      last_available_to_book = Chronic.parse("1 month from now at 6PM");
      # lunch time blocked off for service worker
      lunch_time = Chronic.parse("2PM").strftime("%I:%M%p");
      open_time = Chronic.parse("10AM").strftime("%I:%M%p");
      close_time = Chronic.parse("6PM").strftime("%I:%M%p");
      # time we will push into array to determine available time slots
      slot_to_check = first_available_to_book;

      all_time_slots = [];
      # checks the database and creates an array of time slots where there was already a reservation
      unavailable_time_slots = [];

      Reservation.all.each do |r|
        unavailable_time_slots << "#{r.time_slot}"
      end

      while slot_to_check < last_available_to_book
        # blocks off lunch time daily
        if slot_to_check.strftime("%I:%M%p") != lunch_time
          all_time_slots << "#{slot_to_check.strftime("%B %e at %l:%M %p")} - #{(slot_to_check + 1.hours).strftime("%l:%M %p")}"
        end

        slot_to_check = slot_to_check + 1.hours
        # resets time to the start of the next business day
        if slot_to_check.strftime("%I:%M%p") == close_time
          slot_to_check = slot_to_check + 16.hours
        end
      end

      @available_time_slots = [];
      all_time_slots.each do |slot|
        if !unavailable_time_slots.include?(slot)
          @available_time_slots << slot
        end
      end
    end
  end
end
