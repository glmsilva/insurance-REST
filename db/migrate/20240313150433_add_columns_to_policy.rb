class AddColumnsToPolicy < ActiveRecord::Migration[7.1]
  def change
    add_column :policies, :effective_date, :date
    add_column :policies, :expiration_date, :date
  end
end
