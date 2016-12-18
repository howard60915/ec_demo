class Cart < ApplicationRecord

  belongs_to :user
  has_many :cart_items, :dependent => :destroy
  has_many :items, :through => :cart_items

  def suntotal
    quantiy * item.price
  end

end
