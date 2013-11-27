class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.integer :route_id
      t.string :airport_origin
      t.string :airport_destination
      t.float :distance

      t.timestamps
    end
  end
end
