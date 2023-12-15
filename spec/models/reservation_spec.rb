require 'rails_helper'

RSpec.describe Reservation, type: :model do
  customer = Customer.create(
    first_name: "Miss",
    last_name: "Moneypenny",
    email: "missmoney@email.com"
  )
  vehicle = Vehicle.create(
    make: "BMW",
    model: "Z8",
    year: "1999",
    mileage: 12345,
    license_plate: "xxx-3456",
    customer_id: Customer.where(email: "missmoney@email.com").first.id
  )

  it "is valid with an issue, time slot, customer id, vehicle id" do
    reservation = Reservation.new(
      issue: "needs new brake pads",
      time_slot: "October 17 at 11:00 AM - 12:00 PM",
      completed: false,
      customer_id: Customer.where(email: "missmoney@email.com").first.id,
      vehicle_id: Vehicle.where(make: "BMW", model:"Z8").first.id
    )
    expect(reservation).to be_valid
  end

  it "is invalid without an issue" do
    reservation = Reservation.new(
      issue: nil
    )
    reservation.valid?
    expect(reservation.errors[:issue]).to include("can't be blank")
  end

  it "is invalid without a time slot" do
    reservation = Reservation.new(
      time_slot: nil
    )
    reservation.valid?
    expect(reservation.errors[:time_slot]).to include("can't be blank")
  end

  it "is invalid with a duplicate time slot" do
    Reservation.create(
      issue: "exterior detailing",
      time_slot: "October 20 at 11:00 AM - 12:00 PM",
      completed: false,
      customer_id: Customer.where(email: "missmoney@email.com").first.id,
      vehicle_id: Vehicle.where(make: "BMW", model:"Z8").first.id
    )
    reservation = Reservation.new(
      issue: "windows will not open",
      time_slot: "October 20 at 11:00 AM - 12:00 PM",
      completed: false,
      customer_id: Customer.where(email: "missmoney@email.com").first.id,
      vehicle_id: Vehicle.where(make: "BMW", model:"Z8").first.id
    )
    reservation.valid?
    expect(reservation.errors[:time_slot]).to include("has already been taken")
  end
end
