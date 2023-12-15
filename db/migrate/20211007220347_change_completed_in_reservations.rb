class ChangeCompletedInReservations < ActiveRecord::Migration[6.1]
  def change
    change_column_default :reservations, :completed, from: nil, to: false
  end
end
