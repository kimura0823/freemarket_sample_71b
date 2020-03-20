class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.integer :ancestry, null: false, foreign_key:true
      t.integer :size_tag
      t.timestamps
    end
  end
end
