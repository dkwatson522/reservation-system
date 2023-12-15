class ChangeTimeInReservation < ActiveRecord::Migration[6.1]
  def change
    remove_column :reservations, :start_date, :datetime
    remove_column :reservations, :end_date, :datetime
    add_column :reservations, :time_slot, :string
  end
end
