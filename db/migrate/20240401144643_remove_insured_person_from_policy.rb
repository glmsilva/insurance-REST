class RemoveInsuredPersonFromPolicy < ActiveRecord::Migration[7.1]
  def change
    remove_reference :policies, :insured_person, null: false, foreign_key: true
  end
end
