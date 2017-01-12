class Category < ApplicationRecord

  belongs_to :parent, :class_name => 'Category', :optional => true

  has_many :products, :dependent => :destroy
  has_many :children, :class_name => 'Category', :foreign_key => :parent_id, :dependent => :destroy

  validates_presence_of :name

  scope :enabled, ->{ where(enabled: true) }
  scope :root, ->{ where(parent_id: nil) }
end
