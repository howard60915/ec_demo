class Admin::CategoriesController < Admin::BaseController
  

  def index
    @categories = Category.all

    if params[:id]
      @category = Category.find(params[:id])
    else
      @category = Category.new
    end  
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path
    else
      render :back
    end    
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to admin_categories_path
    else
      render :back
    end  
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      redirect_to admin_categories_path
    else
      render :back
    end  
  end

  def bulk_update
    ids = Array(params[:ids])
    categories = ids.map {|m| Category.find_by_id(m)}.compact

    if params[:commit] == "Delete"
      categories.each {|m| m.destroy }
      redirect_to admin_categories_path
    elsif params[:commit] == "Update"
      categories.each {|m| m.update(category_params)}
      redirect_to admin_categories_path
    else  
      render :back
    end  
  end


  private

  def category_params
    params.require(:category).permit(:name, :description, :enabled)
  end

end
