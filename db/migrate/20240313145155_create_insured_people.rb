class CreateInsuredPeople < ActiveRecord::Migration[7.1]
  def change
    create_table :insured_people do |t|
      t.string :name
      t.string :cpf

      t.timestamps
    end
  end
end
