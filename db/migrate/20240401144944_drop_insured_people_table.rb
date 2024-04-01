class DropInsuredPeopleTable < ActiveRecord::Migration[7.1]
  def up
    drop_table :insured_people
  end
end
