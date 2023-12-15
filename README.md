'# README

* Ruby version
3.0.0

* **Automotive Garage Assumptions**
1. Business Hours are from 10am - 6pm EST
2. Only one reservation per time slot which are 1 hour long
3. Service workers have a daily lunch between 2pm - 3pm where no reservation is available

### Project instructions
Install all added gems using:
*bundle install*

There are example data via db/seeds.rb. this can be initialized by running:
*rails db:seed*
Changes can be cleared and recreated using:
*rails db:reset*

### How to run the test suite
*bin/rspec*

### Endpoints
#### Time Slots
###### Get All Available Time Slots
This endpoint will retrieve all available time slots for the next 30 days. This excludes time slots that are already booked.

http://localhost:3000/api/v1/time_slots

*Example*
{
    "status": "SUCCESS",
    "message": "Loaded available time slots",
    "data": [
        [
            "October 13 at 11:00 AM - 12:00 PM",
            "October 13 at 12:00 PM -  1:00 PM",
            "October 13 at  1:00 PM -  2:00 PM",
            "October 13 at  3:00 PM -  4:00 PM",
            "October 13 at  4:00 PM -  5:00 PM",
            "October 13 at  5:00 PM -  6:00 PM",
            ...
            "November 12 at 10:00 AM - 11:00 AM",
            "November 12 at 11:00 AM - 12:00 PM",
            "November 12 at 12:00 PM -  1:00 PM",
            "November 12 at  1:00 PM -  2:00 PM",
            "November 12 at  3:00 PM -  4:00 PM",
            "November 12 at  4:00 PM -  5:00 PM",
            "November 12 at  5:00 PM -  6:00 PM"
        ]
    ]
}

#### Customer
###### Get All Customers
This endpoint returns all customers. Customers have relations to their reservations and vehicles which allows for retrieval of those associations as well.
http://localhost:3000/api/v1/customers

{
    "status": "SUCCESS",
    "message": "Loaded all customers",
    "data": [
        {
            "id": 3,
            "first_name": "Adriana",
            "last_name": "Schamberger",
            "email": "kym.treutel@lebsack.biz",
            "created_at": "2021-10-12T04:40:36.554-04:00",
            "updated_at": "2021-10-12T04:40:36.554-04:00"
        },
        {
            "id": 5,
            "first_name": "Brittanie",
            "last_name": "Dach",
            "email": "vickey@ernser.org",
            "created_at": "2021-10-12T04:40:36.567-04:00",
            "updated_at": "2021-10-12T04:40:36.567-04:00"
        },
        {
            "id": 1,
            "first_name": "Darla",
            "last_name": "Kreiger",
            "email": "patricia@ziemann-halvorson.io",
            "created_at": "2021-10-12T04:40:36.539-04:00",
            "updated_at": "2021-10-12T04:40:36.539-04:00"
        },
        {
            "id": 4,
            "first_name": "Jeromy",
            "last_name": "Koepp",
            "email": "cammy_runte@emmerich.org",
            "created_at": "2021-10-12T04:40:36.561-04:00",
            "updated_at": "2021-10-12T04:40:36.561-04:00"
        },
        {
            "id": 2,
            "first_name": "Vania",
            "last_name": "Gusikowski",
            "email": "matt@jerde-cruickshank.name",
            "created_at": "2021-10-12T04:40:36.547-04:00",
            "updated_at": "2021-10-12T04:40:36.547-04:00"
        }
    ]
}
###### Show Customer
This endpoint will retrieve Customer data give the id.
http://localhost:3000/api/v1/customers/:id

*Example*
http://localhost:3000/api/v1/customers/1

{
    "status": "SUCCESS",
    "message": "Loaded customer",
    "data": {
        "id": 1,
        "first_name": "Darla",
        "last_name": "Kreiger",
        "email": "patricia@ziemann-halvorson.io",
        "created_at": "2021-10-12T04:40:36.539-04:00",
        "updated_at": "2021-10-12T04:40:36.539-04:00"
    }
}

###### Create Customer
This endpoint will create a new customer.
**requires first_name, last_name, email(unique)**

http://localhost:3000/api/v1/customers

*Example*
http://localhost:3000/api/v1/customers

**Params**
{
    "first_name": "daniel",
    "last_name": "watson",
    "email": "dw@gmail.com"
}

**Response**
{
    "status": "SUCCESS",
    "message": "Saved customer",
    "data": {
        "id": 6,
        "first_name": "daniel",
        "last_name": "watson",
        "email": "dw@gmail.com",
        "created_at": "2021-10-12T04:58:35.619-04:00",
        "updated_at": "2021-10-12T04:58:35.619-04:00"
    }
}
###### Delete Customer
This endpoint will delete the customer and all reservations and vehicles that have been referenced.

http://localhost:3000/api/v1/customers/:id
**requires Customer ID**

*Example*
http://localhost:3000/api/v1/customers/6

**Response**
{
    "status": "SUCCESS",
    "message": "Deleted customer",
    "data": {
        "id": 6,
        "first_name": "daniel",
        "last_name": "watson",
        "email": "dw@gmail.com",
        "created_at": "2021-10-12T04:58:35.619-04:00",
        "updated_at": "2021-10-12T04:58:35.619-04:00"
    }
}

###### Update Customer
This endpoint will update the customer of the given id.
http://localhost:3000/api/v1/customers/:id

*Example*
http://localhost:3000/api/v1/customers/5
**Params**
{
    "first_name": "Daniel",
    "last_name": "Watson",
    "email": "dw@gmail.com"
}
**Response**
{
    "status": "SUCCESS",
    "message": "Updated customer",
    "data": {
        "first_name": "Daniel",
        "last_name": "Watson",
        "email": "dw@gmail.com",
        "id": 5,
        "created_at": "2021-10-12T04:40:36.567-04:00",
        "updated_at": "2021-10-12T04:58:55.400-04:00"
    }
}

#### Reservation
###### Get Customer Reservations
This endpoint will return the reservations for the customer specified with the ID parameter as well as an array time slots that are available.

http://localhost:3000/api/v1/customers/:id/reservations

*Example*
http://localhost:3000/api/v1/customers/1/reservations

**Response**
{
    "status": "SUCCESS",
    "message": "Loaded reservations",
    "data": [
        {
            "id": 1,
            "issue": "routine oil change",
            "completed": true,
            "created_at": "2021-10-12T12:45:56.557-04:00",
            "updated_at": "2021-10-12T12:45:56.557-04:00",
            "customer_id": 1,
            "vehicle_id": 1,
            "time_slot": "October 13 at 10:00 AM - 11:00 AM"
        },
        {
            "id": 2,
            "issue": "fix air conditioning",
            "completed": false,
            "created_at": "2021-10-12T12:45:56.568-04:00",
            "updated_at": "2021-10-12T12:45:56.568-04:00",
            "customer_id": 1,
            "vehicle_id": 1,
            "time_slot": "October 15 at 11:00 AM - 12:00 AM"
        },
        {
            "id": 3,
            "issue": "tire rotation",
            "completed": true,
            "created_at": "2021-10-12T12:45:56.576-04:00",
            "updated_at": "2021-10-12T12:45:56.576-04:00",
            "customer_id": 1,
            "vehicle_id": 2,
            "time_slot": "October 6 at 4:00 PM - 5:00 PM"
        },
        {
            "id": 10,
            "issue": "sunroof will not open",
            "completed": false,
            "created_at": "2021-10-12T15:04:10.220-04:00",
            "updated_at": "2021-10-12T15:04:10.220-04:00",
            "customer_id": 1,
            "vehicle_id": 2,
            "time_slot": "October 17 at 12:00 PM - 1:00 PM"
        }
    ]
}

###### Show Reservations
This endpoint will return the reservation specified with the ID parameter.

http://localhost:3000/api/v1/reservations/:id

*Example*
http://localhost:3000/api/v1/reservations/4

**Response**
{
    "status": "SUCCESS",
    "message": "Loaded reservation",
    "data": {
        "id": 4,
        "issue": "windshield wipers",
        "completed": false,
        "created_at": "2021-10-12T04:40:36.664-04:00",
        "updated_at": "2021-10-12T04:40:36.664-04:00",
        "customer_id": 2,
        "vehicle_id": 3,
        "time_slot": "October 18 at 10:00 AM - 11:00 AM"
    }
}

###### Create Customer Reservation
This endpoint will create a new reservation for the customer specified

**requires Customer ID, Vehicle ID, issue, time_slot**
**optional completed**
http://localhost:3000/api/v1/customers/:id/reservations

*Example*
http://localhost:3000/api/v1/customers/1/reservations

**Params**
{
    "issue": "sunroof will not open",
    "time_slot": "October 17 at 12:00 PM - 1:00 PM",
    "completed": false,
    "vehicle_id": 2,
    "customer_id": 1
}

**Response**
{
    "status": "SUCCESS",
    "message": "Saved reservation",
    "data": {
        "id": 10,
        "issue": "sunroof will not open",
        "completed": false,
        "created_at": "2021-10-12T15:04:10.220-04:00",
        "updated_at": "2021-10-12T15:04:10.220-04:00",
        "customer_id": 1,
        "vehicle_id": 2,
        "time_slot": "October 17 at 12:00 PM - 1:00 PM"
    }
}

###### Delete Reservation
This endpoint will delete reservation given the reservation ID.

http://localhost:3000/api/v1/reservations/:id

*Example*
http://localhost:3000/api/v1/reservations/9

**Response**
{
    "status": "SUCCESS",
    "message": "Deleted reservation",
    "data": {
        "id": 9,
        "issue": "sunroof will not open",
        "completed": false,
        "created_at": "2021-10-12T14:02:56.805-04:00",
        "updated_at": "2021-10-12T14:02:56.805-04:00",
        "customer_id": 1,
        "vehicle_id": 2,
        "time_slot": "October 17 at 11:00 AM - 12:00 PM"
    }
}

###### Update Reservation
This endpoint will update the reservation given the reservation ID.

http://localhost:3000/api/v1/reservations/:id

*Example*
http://localhost:3000/api/v1/reservations/4
**Params**
{
    "completed": true
}

**Response**
{
    "status": "SUCCESS",
    "message": "Updated reservation",
    "data": {
        "completed": true,
        "id": 4,
        "issue": "windshield wipers",
        "created_at": "2021-10-12T04:40:36.664-04:00",
        "updated_at": "2021-10-12T04:58:24.310-04:00",
        "customer_id": 2,
        "vehicle_id": 3,
        "time_slot": "October 18 at 10:00 AM - 11:00 AM"
    }
}

#### Vehicle
###### Get Customer Vehicles
This endpoint will retrieve specified customer vehicles.

http://localhost:3000/api/v1/customers/:id/vehicles

*Example*
http://localhost:3000/api/v1/customers/1/vehicles

**Response**
{
    "status": "SUCCESS",
    "message": "Loaded customer's vehicles",
    "data": [
        {
            "id": 1,
            "make": "Audi",
            "model": "S5",
            "year": "2016",
            "mileage": 71967,
            "license_plate": "MSX-7723",
            "created_at": "2021-10-12T12:45:56.377-04:00",
            "updated_at": "2021-10-12T12:45:56.377-04:00",
            "customer_id": 1
        },
        {
            "id": 1,
            "make": "Audi",
            "model": "S5",
            "year": "2016",
            "mileage": 71967,
            "license_plate": "MSX-7723",
            "created_at": "2021-10-12T12:45:56.377-04:00",
            "updated_at": "2021-10-12T12:45:56.377-04:00",
            "customer_id": 1
        },
        {
            "id": 2,
            "make": "Buick",
            "model": "Durango",
            "year": "2016",
            "mileage": 15963,
            "license_plate": "AIL-3287",
            "created_at": "2021-10-12T12:45:56.391-04:00",
            "updated_at": "2021-10-12T12:45:56.391-04:00",
            "customer_id": 1
        },
        {
            "id": 2,
            "make": "Buick",
            "model": "Durango",
            "year": "2016",
            "mileage": 15963,
            "license_plate": "AIL-3287",
            "created_at": "2021-10-12T12:45:56.391-04:00",
            "updated_at": "2021-10-12T12:45:56.391-04:00",
            "customer_id": 1
        }
    ]
}
###### Show Vehicle
This endpoint will return the vehicle specified by the vehicle id.

http://localhost:3000/api/v1/vehicles/:id

*Example*
http://localhost:3000/api/v1/vehicles/4

**Response**
{
    "status": "SUCCESS",
    "message": "Loaded vehicle",
    "data": {
        "id": 4,
        "make": "Honda",
        "model": "Regal",
        "year": "2020",
        "mileage": 46763,
        "license_plate": "INL-1928",
        "created_at": "2021-10-12T04:40:36.605-04:00",
        "updated_at": "2021-10-12T04:40:36.605-04:00",
        "customer_id": 3
    }
}
###### Create Customer Vehicle
This endpoint will create a new Customer Vehicle for the specified customer id.

http://localhost:3000/api/v1/customers/:id/vehicles
**requires Customer ID, make, model, year, license_plate**
**optional mileage**

*Example*
http://localhost:3000/api/v1/customers/3/vehicles
**Params**
{
    "make": "Acura",
    "model": "RDX",
    "year": 2020,
    "mileage": 21478,
    "license_plate": "DKW-1254",
    "customer_id": 3
}

**Response**
{
    "status": "SUCCESS",
    "message": "Saved vehicle",
    "data": {
        "id": 8,
        "make": "Acura",
        "model": "RDX",
        "year": "2020",
        "mileage": 21478,
        "license_plate": "DKW-1254",
        "created_at": "2021-10-12T04:59:32.993-04:00",
        "updated_at": "2021-10-12T04:59:32.993-04:00",
        "customer_id": 3
    }
}

###### Delete Vehicle
This endpoint will delete the specified vehicle give the vehicle id.

http://localhost:3000/api/v1/vehicles/:id

*Example*
http://localhost:3000/api/v1/vehicles/8

**Response**
{
    "status": "SUCCESS",
    "message": "Deleted vehicle",
    "data": {
        "id": 8,
        "make": "Acura",
        "model": "RDX",
        "year": "2020",
        "mileage": 21478,
        "license_plate": "DKW-1254",
        "created_at": "2021-10-12T04:59:32.993-04:00",
        "updated_at": "2021-10-12T04:59:32.993-04:00",
        "customer_id": 3
    }
}

###### Update Vehicle
This endpoint will update the vehicle for the given vehicle id.

http://localhost:3000/api/v1/vehicles/:id

*Example*
http://localhost:3000/api/v1/vehicles/4
**Params**
{
    "year": 2018
}
**Response**
{
    "status": "SUCCESS",
    "message": "Updated vehicle",
    "data": {
        "year": "2018",
        "id": 4,
        "make": "Honda",
        "model": "Regal",
        "mileage": 46763,
        "license_plate": "INL-1928",
        "created_at": "2021-10-12T04:40:36.605-04:00",
        "updated_at": "2021-10-12T04:59:39.925-04:00",
        "customer_id": 3
    }
}

### Future improvements
* Currently time slots are restricted to start at the top of every hour. In version 2, refactoring to include greater complexity to reserve multiple reservations in one time slot. As well as provide shorter time frames, such as 15 minute reservations (i.e. 11:00am, 11:15 am, 11:30 am, 11:45 am.)
* Additionally time slots can be refactored to link to an actual start & end time datetime fields as opposed to a string to provide more functionality for a calendar
* Provide additional business hours on specific days and weekends.
