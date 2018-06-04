class AddOfficeDetails < ActiveRecord::Migration
  def change
  	add_column :offices, :languages, :string
  	add_column :offices, :public_transit, :boolean, default: false
  	add_column :offices, :wheelchair_accessible, :boolean, default: false
  end
end
