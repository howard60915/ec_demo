class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @cart = find_cart
    @cart_item = @cart.cart_items.includes(:item)
  end

  def remove_item
    @cart = find_cart
    @cart_item = @cart.cart_items.find_by(params[:item_id])

    @cart_item.destroy
    redirect_to :back, alert: "#{@cart_item.item.name} has been removed"    
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
