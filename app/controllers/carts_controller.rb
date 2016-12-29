class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @cart = find_cart
    @cart_item = @cart.cart_items.includes(:item)

  end


  private
  def find_cart
    if current_user.cart
      Cart.find_by(id: current_user.cart.id) || Cart.new(:user => current_user)
    else  
      Cart.new(:user => current_user)
    end  
  end
end
