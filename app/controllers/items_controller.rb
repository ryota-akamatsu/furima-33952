class ItemsController < ApplicationController
  before_action :authenticate_user!,except:[:index,:show]
  def index
    @item = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update

  end
  private
  def items_params
    params.require(:item).permit(:image,:title,:delivery_date_id,:price,:category_id,:product_status_id,:shipping_id,:area_id,:description_item).merge(user_id: current_user.id)
  end

end
