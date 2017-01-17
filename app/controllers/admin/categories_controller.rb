class Admin::CategoriesController < Admin::BaseController
  

  def index
    @categories = Category.root.all
    @category_status = [true, false]
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
    categories = ids.map { |m| Category.find_by_id(m) }.compact
    
    enabled_ids = Array(params[:enabled_ids])
    enableds = enabled_ids.map { |m| Category.find_by_id(m) }.compact
    enabled_status = params[:enabled].map { |e| e == "true" }

    if params[:commit] == "Delete"
      categories.each {|m| m.destroy }
      redirect_to admin_categories_path
    elsif params[:commit] == "Update"
      enableds.each {|m| m.update(:enabled => enabled_status[enableds.index(m)])}
      redirect_to admin_categories_path
    else  
      render :back
    end  
  end


  private

  def category_params
    params.require(:category).permit(:name, :description, :enabled, :parent_id)
  end

end
