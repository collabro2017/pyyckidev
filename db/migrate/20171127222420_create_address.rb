class CreateAddress < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street1
      t.string :street2
      t.string :city
      t.string :state
      t.string :zip_code
      t.float :latitude
      t.float :longitude
      t.integer :addressable_id
      t.string :addressable_type

      t.timestamps null: false
    end
  end
end
