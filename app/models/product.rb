class Product < ApplicationRecord

  belongs_to :category
  belongs_to :firm

  has_many :cart_items, foreign_key: 'item_id', :dependent => :destroy
  has_many :carts, :through => :cart_items

  validates_presence_of :name, :price

  scope :activated, ->{where(activated: true)}
end
