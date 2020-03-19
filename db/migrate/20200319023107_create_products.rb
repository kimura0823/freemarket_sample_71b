class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.integer :category_id, null: false, foreign_key: true
      t.string :brand
      t.string :status, null:false
      t.integer :price, null:false
      t.integer :user_id, null:false, foreign_key: true
      t.timestamps
    end
  end
end
