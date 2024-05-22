class CreateStoreSections < ActiveRecord::Migration[7.1]
  def change
    create_table :store_sections do |t|
      t.string :name

      t.timestamps
    end
  end
end
