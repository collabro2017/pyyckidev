class CreateYelpAccount < ActiveRecord::Migration
  def change
    create_table :yelp_accounts do |t|
      t.integer :office_id
      t.string :external_id
      t.string :url
      t.string :name
      t.decimal :rating
      t.integer :review_count
      t.jsonb :raw_response

      t.timestamps
    end
    add_index :yelp_accounts, :office_id
  end
end
