class Reservation < ApplicationRecord
  belongs_to :customer
  belongs_to :vehicle
  validates_uniqueness_of :time_slot
  validates :time_slot, presence: true
  validates :issue, presence: true

end
