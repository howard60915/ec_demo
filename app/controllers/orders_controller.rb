class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_cart, only: :create
  before_action :current_cart, only: :create

  def index
    @orders = current_user.orders.page(params[:page]).per(5)
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def new
    @order = current_user.orders.new(:email => current_user.email)
  end

  def create
    @order = current_user.orders.new(order_params)
    @order.add_items(current_cart)
    if @order.save
      current_cart.destroy
      redirect_to orders_path
    else
      render :new, alter: @order.errors.full_message if @order.errors
    end  

  end

  private

  def order_params
    params.require(:order).permit(:email, :name, :mobile)
  end

  def find_cart
    if current_user.cart
      Cart.find_by(id: current_user.cart.id) || Cart.new(:user => current_user)
    else
      Cart.new(:user => current_user)
    end    
  end

  def current_cart
    current_cart ||= find_cart
  end

  def check_cart
    redirect_to :back, notice: "購物車沒有東西喔" if current_cart.empty?
  end

  helper_method :current_cart
end
