class PurchasesController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_item, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
    @purchase_form = PurchaseForm.new
  end

  

  def create
    @purchase_form = PurchaseForm.new(purchase_params)
    if @purchase_form.valid?
      @purchase_form.save(current_user.id)
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end


  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.require(:purchase_form).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def address_params
    params.permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(purchase_id: @purchase.id, user_id: current_user.id)
  end
end
