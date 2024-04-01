class RemoveVehicleFromPolicy < ActiveRecord::Migration[7.1]
  def change
    remove_reference :policies, :vehicle, null: false, foreign_key: true
  end
end
