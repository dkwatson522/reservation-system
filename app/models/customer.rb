class Customer < ApplicationRecord
  # customers will have many reservations and cars
  has_many :reservations, dependent: :destroy
  has_many :vehicles, through: :reservations, dependent: :destroy
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates_uniqueness_of :email
end
