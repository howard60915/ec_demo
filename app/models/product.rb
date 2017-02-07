class Product < ApplicationRecord

  belongs_to :category
  belongs_to :firm

  has_many :cart_items, foreign_key: 'item_id', :dependent => :destroy
  has_many :carts, :through => :cart_items
  has_many :order_items, foreign_key: 'item_id', :dependent => :destroy
  has_many :orders, :through => :order_items
  has_many :comments, as: :commentable

  validates_presence_of :name, :price

  scope :activated, ->{where(activated: true)}
  scope :enabled, ->{where(categories: {enabled: true})}
end
