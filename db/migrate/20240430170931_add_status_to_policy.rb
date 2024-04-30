class AddStatusToPolicy < ActiveRecord::Migration[7.1]
  def change
    add_column :policies, :status, :integer, default: 0
  end
end
