class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_parameter)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @image = @item.image 
  end

  private

  def item_parameter
    params.require(:item).permit(
      :image, :name, :price, :description, :category_id, :statement_id, :delivery_fee_id, :prefecture_id, :delivery_date_id
    ).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
