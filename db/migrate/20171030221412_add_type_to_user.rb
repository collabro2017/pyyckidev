class AddTypeToUser < ActiveRecord::Migration
  def change
    add_column :users, :type, :string, default: 'Patient'
  end
end
