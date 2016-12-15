class CategoryProductsController < ApplicationController

def show
  @category = Category.enabled.all.find(params[:category_id]) 
  @product = @category.products.activated.find(params[:id])
end



end
