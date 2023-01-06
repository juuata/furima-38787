class PurchasesController < ApplicationController
  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(donation_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :municipalities, :address, :building_name, :phone_number).merge(user_id: current_user.id)
  end

end
