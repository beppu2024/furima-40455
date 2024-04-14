class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  
  def index
  end

  def new
    @item = current_user.items.build
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new,status: :unprocessable_entity
    end
  end

end

private

def item_params
  params.require(:item).permit(:image, :item, :message, :category_id, :situation_id, :expense_id, :prefecture_id, :until_day_id, :price, :user_id )
end