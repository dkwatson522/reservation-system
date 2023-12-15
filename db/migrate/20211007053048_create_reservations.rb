class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.datetime :appointment_time
      t.string :issue
      t.boolean :completed, default:false

      t.timestamps
    end
  end
end
