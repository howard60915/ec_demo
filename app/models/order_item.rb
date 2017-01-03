class OrderItem < ApplicationRecord

  belongs_to :order
  belongs_to :item, class_name: 'Product'

  validates_presence_of :quantity

  def subtotal
    quantity * price
  end


end
