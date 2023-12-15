class CreateVehicles < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicles do |t|
      t.string :make
      t.string :model
      t.integer :year
      t.integer :mileage
      t.string :license_plate

      t.timestamps

    end


  end
end
