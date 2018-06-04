class CreateReview < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :office_id
      t.integer :yelp_account_id
      t.text :text
      t.string :url
      t.decimal :rating
      t.jsonb :user_info
      t.datetime :posted_at
      t.jsonb :raw_response

      t.timestamps
    end
    add_index :reviews, :yelp_account_id
    add_index :reviews, :office_id
  end
end
