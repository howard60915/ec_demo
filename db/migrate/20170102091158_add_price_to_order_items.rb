class AddPriceToOrderItems < ActiveRecord::Migration[5.0]
  def change
    add_column :order_items, :price, :integer, default: 0
  end
end
