class CategoriesController < ApplicationController

  def show
    @categories = Category.enabled.all
    @category = @categories.find(params[:id])
    @products = @category.products.activated.page(params[:page]).per(4)
  end

end
