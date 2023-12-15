require 'rails_helper'


RSpec.describe Vehicle, type: :model do
  customer = Customer.create(
    first_name: "Mr",
    last_name: "White",
    email: "mwhite@email.com"
  )

  it "is valid with a make, model, year, license plate, customer ID" do
    vehicle = Vehicle.new(
      make: "Aston Martin",
      model: "Vanquish",
      year: "2002",
      mileage: nil,
      license_plate: "xxx-1234",
      customer_id: Customer.first.id
    )
    expect(vehicle).to be_valid
  end

  it "is invalid without a make" do
    vehicle = Vehicle.new(
      make: nil
    )
    vehicle.valid?
    expect(vehicle.errors[:make]).to include("can't be blank")
  end

  it "is invalid without a model" do
    vehicle = Vehicle.new(
      model: nil
    )
    vehicle.valid?
    expect(vehicle.errors[:model]).to include("can't be blank")
  end

  it "is invalid without a year" do
    vehicle = Vehicle.new(
      year: nil
    )
    vehicle.valid?
    expect(vehicle.errors[:year]).to include("can't be blank")
  end

  it "is invalid without a license plate" do
    vehicle = Vehicle.new(
      license_plate: nil
    )
    vehicle.valid?
    expect(vehicle.errors[:license_plate]).to include("can't be blank")
  end

  it "is invalid without a customer id" do
    vehicle = Vehicle.new(
      customer_id: nil
    )
    vehicle.valid?
    expect(vehicle.errors[:customer_id]).to include("can't be blank")
  end
end
