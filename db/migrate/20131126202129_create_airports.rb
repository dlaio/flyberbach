class CreateAirports < ActiveRecord::Migration
  def change
    create_table :airports do |t|
      t.string :airport_code
      t.string :airport_name
      t.string :location_city
      t.string :country
      t.string :latitude
      t.string :longitude
      t.string :altitude
      t.string :timezone

      t.timestamps
    end
  end
end
