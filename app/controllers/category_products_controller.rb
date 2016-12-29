class CategoryProductsController < ApplicationController

  before_action :set_category

  def show
    @product = @category.products.activated.find(params[:id])
  end

  def add_item
    @product = @category.products.activated.find(params[:id])
    @cart = find_cart
    @cart.add_item(@product)
    redirect_to category_product_path(@category, @product), notice: "#{@product.name} is added to your cart"
  end

  private

  def set_category
    @category = Category.enabled.all.find(params[:category_id])
  end

  def find_cart
    if current_user.cart
      current_user.cart || Cart.new(:user => current_user)
    else  
      Cart.new(:user => current_user)
    end  
  end

end
