class CategoriesController < ApplicationController

  def show
    @categories = Category.root.enabled
    @category = Category.find(params[:id])
    @products = @category.products.activated.page(params[:page]).per(4)
  end

end
