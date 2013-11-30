class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :departure_airport
      t.datetime :departure_time
      t.string :arrival_airport
      t.datetime :arrival_time

      t.timestamps
    end
  end
end
