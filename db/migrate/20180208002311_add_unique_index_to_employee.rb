class AddUniqueIndexToEmployee < ActiveRecord::Migration
  def change
    add_index :employees, [:user_id, :office_id], unique: true
  end
end
