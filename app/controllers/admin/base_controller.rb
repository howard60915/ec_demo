class Admin::BaseController < ApplicationController
  layout 'admin'
  before_action :authenticate_user!
  before_action :authenticate_admin!

  private
  def authenticate_admin!
    redirect_to root_path, notice: "Not Authorized" unless current_user.admin?
  end

end