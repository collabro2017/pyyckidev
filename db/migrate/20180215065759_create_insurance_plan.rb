class CreateInsurancePlan < ActiveRecord::Migration
  def change
    create_table :insurance_plans do |t|
      t.integer :insurance_carrier_id
      t.string :name

      t.timestamps
    end
    add_index :insurance_plans, :insurance_carrier_id
  end
end
