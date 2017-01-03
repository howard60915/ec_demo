class Order < ApplicationRecord

  belongs_to :user

  has_many :order_items, :dependent => :destroy
  has_many :payments, :dependent => :destroy

  validates_presence_of :name, :email, :amount

  def add_items(cart)
    self.transaction do
      self.amount ||= 0
      cart.cart_items.each do |cart_item|
        order = order_items.build(
            :item_id => cart_item.item_id,
            :quantity => cart_item.quantity,
            :price => cart_item.item.price
          )
        self.amount += order.subtotal
      end  
    end
  end
end
