class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :name,         null: false
      t.integer :age,         null: false
      t.boolean :sex,         null: false
      t.string :belonging,    null: false   
      t.date   :session_day,  null: false 
      t.string :session_time, null: false  
      t.text :remarks
      t.references :trainer,     foreign_key: true
      t.timestamps
    end
  end
end
