class CreateVehicles < ActiveRecord::Migration[7.1]
  def change
    create_table :vehicles do |t|
      t.string :brand
      t.string :model
      t.string :year
      t.string :license_plate

      t.timestamps
    end
  end
end
