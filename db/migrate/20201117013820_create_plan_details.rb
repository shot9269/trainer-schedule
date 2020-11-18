class CreatePlanDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :plan_details do |t|
      t.string :subject,  null:false
      t.integer :weight,  null:false
      t.integer :set,     null:false
      t.integer :rep,     null:false
      t.string :cardio
      t.integer :cardio_time
      t.references :plan, foreign_key: true
      t.timestamps
    end
  end
end
