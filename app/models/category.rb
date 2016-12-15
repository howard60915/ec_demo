class Category < ApplicationRecord

  has_many :products, :dependent => :destroy

  validates_presence_of :name

  scope :enabled, ->{ where(enabled: true) }
end
