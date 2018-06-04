class CreateClaim < ActiveRecord::Migration
  def change
    create_table :claims do |t|
      t.integer :office_id
      t.integer :user_id
      t.string :code
      t.datetime :notified_at
      t.boolean :successful, default: false

      t.timestamps
    end
  end
end
