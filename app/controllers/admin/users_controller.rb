class Admin::UsersController < Admin::BaseController

  def index
    @users = User.all

    if params[:id]
      @user = User.find(params[:id])
    else
      @user = User.new
    end  
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to admin_users_path
    else
      render :back
    end  
  end

  def destroy
    @user = User.find(params[:id])

    if @user.destroy
      redirect_to admin_users_path
    else
      render :back
    end
  end

  def bulk_update
    ids = Array(params[:ids])
    users = ids.map {|m| User.find_by_id(m)}.compact

    if params[:commit] == "Delete"
      users.each {|m| m.destroy }
      redirect_to admin_users_path
    else  
      render :back
    end  
  end


  private

  def user_params
    params.require(:user).permit(:email, :admin)
  end
end
