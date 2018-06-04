class CreateAcceptedPlan < ActiveRecord::Migration
  def change
    create_table :accepted_plans do |t|
    	t.integer :insurance_plan_id
    	t.integer :office_id

    	t.timestamps
    end
    add_index :accepted_plans, :insurance_plan_id
    add_index :accepted_plans, :office_id
  end
end
