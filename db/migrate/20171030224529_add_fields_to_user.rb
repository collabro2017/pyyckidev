class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :phone, :string
    add_column :users, :services_description, :text
    add_column :users, :awards_description, :text
    add_column :users, :verified, :boolean
  end
end
