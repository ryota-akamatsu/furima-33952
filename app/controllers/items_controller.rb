class ItemsController < ApplicationController
  before_action :authenticate_user!,except:[:index,:show]
  before_action :edit_move_to_index,only:[:edit]
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
  def show
     @item = Item.find(params[:id])
  end

  def edit
     @item = Item.find(params[:id])
   
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(items_params)
    return redirect_to root_path 
    else
      render :edit
    end
  end
  private
  def items_params
    params.require(:item).permit(:image,:title,:delivery_date_id,:price,:category_id,:product_status_id,:shipping_id,:area_id,:description_item).merge(user_id: current_user.id)
  end
  def edit_move_to_index
    @item = Item.find(params[:id])
      unless  current_user.id == @item.user_id
        redirect_to action: :index
    end
  end
end
