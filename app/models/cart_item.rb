class CartItem < ApplicationRecord

  belongs_to :items, :class_name => "Product"
  belongs_to :carts

  


end
