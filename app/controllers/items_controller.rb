class ItemsController < ApplicationController
  def new
    @items = Item.new
  end

  def  create
    item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:items_name, :description, :category_id, :status_id, :shipping_charge_id, :prefecture_id, :days_for_shipping_id, :price, :user)
  end
end
