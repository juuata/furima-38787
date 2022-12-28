class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:items_name, :description, :category_id, :status_id, :shipping_charge_id, :prefecture_id, :days_for_shipping_id, :price, :image).merge(user_id: current_user.id)
  end
end
