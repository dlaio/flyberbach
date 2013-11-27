class CreateFlightLegs < ActiveRecord::Migration
  def change
    create_table :flight_legs do |t|
      t.integer :leg_no
      t.string :flight_no
      t.integer :route_id
      t.decimal :price

      t.timestamps
    end
  end
end
