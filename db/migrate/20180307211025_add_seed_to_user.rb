class AddSeedToUser < ActiveRecord::Migration
  def change
  	add_column :users, :seeded, :boolean, default: false
  	add_column :users, :title, :string
  	add_column :users, :gender, :string
  end
end
