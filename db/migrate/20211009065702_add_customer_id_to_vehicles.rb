class AddCustomerIdToVehicles < ActiveRecord::Migration[6.1]
  def change
    add_column :vehicles, :customer_id, :integer
    add_index :vehicles, :customer_id
  end
end
