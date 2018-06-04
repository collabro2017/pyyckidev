class AddOffices < ActiveRecord::Migration
  def change
    create_table :offices do |t|
      t.string :name, null: false, default: ""
      t.string :phone
      t.text :services_description
      t.text :awards_description
      t.text :email
      t.boolean :claimed, null: false, default: false
      t.string :slug

      t.timestamps null: false
    end
    add_index :offices, :slug
  end
end
