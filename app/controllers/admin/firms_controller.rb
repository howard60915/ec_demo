class Admin::FirmsController < Admin::BaseController

  def index
    @firms = Firm.all

    if params[:id]
      @firm = Firm.find(params[:id])
    else
      @firm = Firm.new
    end  
  end

  def create
    @firm = Firm.new(firm_params)
    if @firm.save
      redirect_to admin_firms_path
    else
      render :back
    end    
  end

  def update
    @firm = Firm.find(params[:id])
    if @firm.update(firm_params)
      redirect_to admin_firms_path
    else
      render :back
    end  
  end

  def destroy
    @firm = Firm.find(params[:id])
    if @firm.destroy
      redirect_to admin_firms_path
    else
      render :back
    end  
  end

  def bulk_update
    ids = Array(params[:ids])
    firms = ids.map {|m| Firm.find_by_id(m)}.compact

    if params[:commit] == "Delete"
      firms.each {|m| m.destroy }
      redirect_to admin_firms_path
    else  
      render :back
    end  
  end


  private

  def firm_params
    params.require(:firm).permit(:name, :industry, :tel, :address)
  end

end
