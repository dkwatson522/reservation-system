require 'rails_helper'

RSpec.describe Customer, type: :model do
  it "is valid with a first name, last name, email" do
    customer = Customer.new(
      first_name: "James",
      last_name: "Bond",
      email: "jb007@email.com"
    )
    expect(customer).to be_valid
  end
  it "is invalid without a first name" do
    customer = Customer.new(first_name: nil)
    customer.valid?
    expect(customer.errors[:first_name]).to include("can't be blank")
  end
  it "is invalid without a last name" do
    customer = Customer.new(last_name: nil)
    customer.valid?
    expect(customer.errors[:last_name]).to include("can't be blank")
  end
  it "is invalid without a email address" do
    customer = Customer.new(email: nil)
    customer.valid?
    expect(customer.errors[:email]).to include("can't be blank")
  end
  it "is invalid with a duplicate email address" do
    Customer.create(
      first_name: "Ernst",
      last_name: "Blofeld",
      email: "007assassin@email.com"
    )
    customer = Customer.new(
      first_name: "Auric",
      last_name: "Goldfinger",
      email: "007assassin@email.com"
    )
    customer.valid?
    expect(customer.errors[:email]).to include("has already been taken")
  end
end
