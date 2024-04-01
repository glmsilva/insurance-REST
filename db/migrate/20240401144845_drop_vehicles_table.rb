class DropVehiclesTable < ActiveRecord::Migration[7.1]
  def up
    drop_table :vehicles
  end
end
