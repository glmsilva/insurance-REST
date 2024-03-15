class AddRefsToPolicies < ActiveRecord::Migration[7.1]
  def change
    add_reference :policies, :insured_person, null: false, foreign_key: true
    add_reference :policies, :vehicle, null: false, foreign_key: true
  end
end
