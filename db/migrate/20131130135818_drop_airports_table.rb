class DropAirportsTable < ActiveRecord::Migration
  def change
  end

  def up
    drop_table :airports
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
