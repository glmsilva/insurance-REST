class AddInsuredPersonToPolicy < ActiveRecord::Migration[7.1]
  def change
    add_column :policies, :insured_person, :jsonb
  end
end
