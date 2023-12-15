class Vehicle < ApplicationRecord
  belongs_to :customer
  has_many :reservations
  validates :make, presence: true
  validates :model, presence: true
  validates :year, presence: true
  validates :license_plate, presence: true
  validates :customer_id, presence: true

end
