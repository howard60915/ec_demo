class Product < ApplicationRecord

  belongs_to :category
  belongs_to :firms

  validates_presence_of :name, :price

  scope :activated, ->{where(activated: true)}
end
