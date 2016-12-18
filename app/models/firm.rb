class Firm < ApplicationRecord

  has_many :products, :dependent => :destroy

end
