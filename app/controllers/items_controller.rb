class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update]
  before_action :sold_out_item, only: [:edit]

  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = current_user.items.build
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    return if current_user == @item.user

    redirect_to root_path
  end

  def update
    @item.update(item_params)
    if @item.valid?
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if current_user == @item.user
      @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def sold_out_item
    redirect_to root_path if @item.purchase.present?
  end


  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :item, :message, :category_id, :situation_id, :expense_id, :prefecture_id, :until_day_id,
                                 :price, :user_id)
  end
end
