class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.datetime :purchase_date
      t.string :store_name
      t.boolean :purchased
      t.integer :quantity
      t.references :store_section, foreign_key: true


      t.timestamps
    end
  end
end
