class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.string :airline, :null => false 
      t.string :flight_no, :null => false
      t.string :plane_type, :null => false
      t.datetime :leave_time, :null => false
      t.string :leave_city, :null => false
      t.datetime :arrive_time, :null => false
      t.string :arrive_city, :null => false
      t.text :remark
      t.datetime :created_at, :null => false
      t.datetime :updated_at, :null => false
      t.float :price, :null => false
      t.string :cabin_class, :null => false

      t.timestamps
    end
  end
end
