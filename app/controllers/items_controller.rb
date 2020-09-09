class ItemsController < ApplicationController
  before_action :move_to_index, except: :index
  def index
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.create(item_parameter)
    if item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_parameter
    params.require(:item).permit(
      :image, :name, :description, :category_id, :statement_id, :delivery_fee_id, :prefecture_id, :delivery_date_id, :price
    )
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
