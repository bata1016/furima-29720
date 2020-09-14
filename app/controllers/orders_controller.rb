class OrdersController < ApplicationController
  before_action :move_to_sign_up

  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
  end

  def create 
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.permit(:price, :token)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_sign_up
    redirect_to new_user_session_path unless user_signed_in?
  end
end
