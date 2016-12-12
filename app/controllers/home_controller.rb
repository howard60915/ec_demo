class HomeController < ApplicationController

  def index
    @categories = Category.enabled.all
    @products = Product.activated.includes(:category).order('id desc').page(params[:page])
  end

end