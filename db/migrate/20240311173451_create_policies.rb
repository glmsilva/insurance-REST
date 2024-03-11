class CreatePolicies < ActiveRecord::Migration[7.1]
  def change
    create_table :policies do |t|

      t.timestamps
    end
  end
end
