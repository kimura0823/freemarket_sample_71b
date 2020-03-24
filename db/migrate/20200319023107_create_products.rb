class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.integer :category_id, null: false, foreign_key: true
      t.string :brand
      t.integer :price, null: false
      t.string :judge, default: "出品中"
      t.integer :user_id, null: false, foreign_key: true
      t.integer :burden_id, null: false
      t.integer :days_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :status_id, null: false
      t.timestamps
    end
  end
end
