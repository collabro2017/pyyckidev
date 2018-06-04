class CreateInsuranceCarrier < ActiveRecord::Migration
  def change
    create_table :insurance_carriers do |t|
      t.string :logo
      t.string :name

      t.timestamps
    end
  end
end
