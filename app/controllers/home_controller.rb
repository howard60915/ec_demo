class HomeController < ApplicationController

  def index
    @products = Product.enabled.activated.joins(:category)
    if params[:search]
      @products = @products.activated.enabled.where( ["products.name like ?", "%#{params[:search]}%"] )
      # 關聯資料表若有欄位名稱相同，必須明確告訴資料庫我要的是哪一個表的欄位
    else
      @products = @products.enabled.activated
    end  
    @categories = Category.root.enabled.all
    @products = @products.order("id DESC").page(params[:page]).per(8)

  end

end