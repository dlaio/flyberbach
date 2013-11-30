class RemoveCabinClassFromFlight < ActiveRecord::Migration
  def change
    remove_column :flights, :cabin_class, :string
  end
end
