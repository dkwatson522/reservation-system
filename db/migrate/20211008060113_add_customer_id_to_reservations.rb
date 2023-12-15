class AddCustomerIdToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :customer_id, :integer
    add_index :reservations, :customer_id
  end
end
