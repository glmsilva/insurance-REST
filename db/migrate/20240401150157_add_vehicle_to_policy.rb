class AddVehicleToPolicy < ActiveRecord::Migration[7.1]
  def change
    add_column :policies, :vehicle, :jsonb
  end
end
