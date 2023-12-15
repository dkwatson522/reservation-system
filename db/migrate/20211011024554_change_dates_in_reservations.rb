class ChangeDatesInReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :start_date, :datetime, unique: true
    add_column :reservations, :end_date, :datetime, unique: true
    remove_column :reservations, :appointment_time, :datetime
  end
end
