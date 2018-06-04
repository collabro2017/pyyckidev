class AddressBelongsToOffice < ActiveRecord::Migration
  def change
  	rename_column :addresses, :addressable_id, :office_id
  end
end
