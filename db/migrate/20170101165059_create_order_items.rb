class CreateOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :order_items do |t|
      t.integer :item_id
      t.integer :order_id
      t.integer :quantity, default: 0
      t.timestamps
    end
    add_index :order_items, :item_id
    add_index :order_items, :order_id
  end
end
