class Admin::ProductsController < Admin::BaseController

  def index
    @products = Product.all.includes(:category, :firm).order("id DESC").page(params[:page]).per(5)
    @categories = Array(Category.enabled).map { |c| [ c.name, c.id ]  } 
    @firms = Array(Firm.all).map { |c| [ c.name, c.id ]  } 
    
    if params[:id]
      @product = Product.find(params[:id])
    else
      @product = Product.new
    end  
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path
    else
      render :back
    end    
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_products_path
    else
      render :back
    end  
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      redirect_to admin_products_path
    else
      render :back
    end  
  end

  def bulk_update
    ids = Array(params[:ids])
    products = ids.map {|m| Product.find_by_id(m)}.compact

    if params[:commit] == "Delete"
      products.each {|m| m.destroy }
      redirect_to admin_products_path
    else  
      render :back
    end  
  end


  private

  def product_params
    params.require(:product).permit(:name, :content, :price, :activated, :category_id, :firm_id)
  end
end
