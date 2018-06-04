class AddBannerToOffice < ActiveRecord::Migration
  def change
    add_column :offices, :banner, :string
  end
end
