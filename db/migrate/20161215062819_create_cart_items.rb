class CreateCartItems < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_items do |t|
      t.integer :item_id
      t.integer :cart_id
      t.integer :quantity, :default => 0
      t.timestamps
    end
    add_index :cart_items, :cart_id
    add_index :cart_items, :item_id
  end
end
