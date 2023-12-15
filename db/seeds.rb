5.times do
  Customer.create({
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email
  })
end


car1 = Vehicle.create({
  make: Faker::Vehicle.make,
  model: Faker::Vehicle.model,
  year: Faker::Vehicle.year,
  mileage: Faker::Vehicle.mileage,
  license_plate: Faker::Vehicle.license_plate,
  customer_id: 1
})
car2 = Vehicle.create({
  make: Faker::Vehicle.make,
  model: Faker::Vehicle.model,
  year: Faker::Vehicle.year,
  mileage: Faker::Vehicle.mileage,
  license_plate: Faker::Vehicle.license_plate,
  customer_id: 1
})
car3 = Vehicle.create({
  make: Faker::Vehicle.make,
  model: Faker::Vehicle.model,
  year: Faker::Vehicle.year,
  mileage: Faker::Vehicle.mileage,
  license_plate: Faker::Vehicle.license_plate,
  customer_id: 2
})
car4 = Vehicle.create({
  make: Faker::Vehicle.make,
  model: Faker::Vehicle.model,
  year: Faker::Vehicle.year,
  mileage: Faker::Vehicle.mileage,
  license_plate: Faker::Vehicle.license_plate,
  customer_id: 3
})
car5 = Vehicle.create({
  make: Faker::Vehicle.make,
  model: Faker::Vehicle.model,
  year: Faker::Vehicle.year,
  mileage: Faker::Vehicle.mileage,
  license_plate: Faker::Vehicle.license_plate,
  customer_id: 4
})
car6 = Vehicle.create({
  make: Faker::Vehicle.make,
  model: Faker::Vehicle.model,
  year: Faker::Vehicle.year,
  mileage: Faker::Vehicle.mileage,
  license_plate: Faker::Vehicle.license_plate,
  customer_id: 5
})
car7 = Vehicle.create({
  make: Faker::Vehicle.make,
  model: Faker::Vehicle.model,
  year: Faker::Vehicle.year,
  mileage: Faker::Vehicle.mileage,
  license_plate: Faker::Vehicle.license_plate,
  customer_id: 5
})


reservation1 = Reservation.create(
  issue: "routine oil change",
  time_slot: "October 13 at 10:00 AM - 11:00 AM",
  completed: Faker::Boolean.boolean,
  customer_id: 1,
  vehicle_id: 1
)
reservation8 = Reservation.create(
  issue: "fix air conditioning",
  time_slot: "October 15 at 11:00 AM - 12:00 AM",
  completed: Faker::Boolean.boolean,
  customer_id: 1,
  vehicle_id: 1
)
reservation2 = Reservation.create(
  issue: "tire rotation",
  time_slot: "October 6 at 4:00 PM - 5:00 PM",
  completed: Faker::Boolean.boolean,
  customer_id: 1,
  vehicle_id: 2
)
reservation3 = Reservation.create(
  issue: "windshield wipers",
  completed: Faker::Boolean.boolean,
  customer_id: 2,
  vehicle_id: 3
)
reservation4 = Reservation.create(
  issue: "fix brakes",
  time_slot: "October 25 at 11:00 AM - 12:00 AM",
  completed: Faker::Boolean.boolean,
  customer_id: 3,
  vehicle_id: 4
)
reservation5 = Reservation.create(
  issue: "flat tire",
  time_slot: "October 30 at 1:00 PM - 2:00 PM",
  completed: Faker::Boolean.boolean,
  customer_id: 4,
  vehicle_id: 5
)
reservation6 = Reservation.create(
  issue: "replace seatbelt",
  time_slot: "October 18 at 9:00 AM - 10:00 AM",
  completed: Faker::Boolean.boolean,
  customer_id: 5,
  vehicle_id: 6
)
reservation7 = Reservation.create(
  issue: "fix tail light",
  # start_date: Chronic.parse("2021-10-17 at 5pm"),
  # end_date: Chronic.parse("2021-10-17 at 5pm") + 1.hours,
  time_slot: "October 24 at 10:00 AM - 11:00 AM",
  completed: Faker::Boolean.boolean,
  customer_id: 5,
  vehicle_id: 7
)
