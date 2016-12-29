class Cart < ApplicationRecord

  belongs_to :user
  has_many :cart_items, :dependent => :destroy
  has_many :items, :through => :cart_items

  def empty?
    self.cart_items.empty?
  end

  def add_item(product)
    cart_item = self.cart_items.where(item_id: product.id).first_or_initialize
    cart_item.increment(:quantity)
    self.save && cart_item.save
  end

  def total
    cart_items.sum(&:subtotal)
  end

end
