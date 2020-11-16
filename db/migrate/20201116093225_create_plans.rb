class CreatePlans < ActiveRecord::Migration[6.0]
  def change
    create_table :plans do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.text :caution, null: false
      t.references :client, foreign_key: true
      t.timestamps
    end
  end
end
