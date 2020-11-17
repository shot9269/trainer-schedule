class CreatePlanDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :plan_details do |t|

      t.timestamps
    end
  end
end
