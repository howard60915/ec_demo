class CartItem < ApplicationRecord

  belongs_to :item, :class_name => "Product"
  belongs_to :cart

  def subtotal
    quantity * item.price
  end


end
