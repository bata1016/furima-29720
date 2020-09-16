class OrdersController < ApplicationController
  before_action :move_to_sign_up

  def index
    @item = Item.find(params[:item_id])
    @order = OrderShopping.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = OrderShopping.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render "index"
      # redirect_to item_orders_path(@item.id)
    end
  end

  private

  def order_params
    params.permit(:postcode, :city, :block, :building, :phone_number, :prefecture_id, :item_id, :token).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_sign_up
    redirect_to new_user_session_path unless user_signed_in?
  end
end
