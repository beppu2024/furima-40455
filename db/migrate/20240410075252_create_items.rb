class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :item,           null: false
      t.text :message,          null: false
      t.integer :category_id,   null: false
      t.integer :situation_id,  null: false
      t.integer :expense_id,    null: false
      t.integer :prefecture_id, null: false
      t.integer :until_day_id,  null: false
      t.integer :price,         null: false
      t.references :user,       null: false, foreign_key: true
      t.timestamps
    end
  end
end
