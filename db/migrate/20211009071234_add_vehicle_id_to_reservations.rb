class AddVehicleIdToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :vehicle_id, :integer
    add_index :reservations, :vehicle_id
  end
end
