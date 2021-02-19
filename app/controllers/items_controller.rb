class ItemsController < ApplicationController
  before_action :authenticate_user!,except:[:index,:show]
  before_action :items_move,only:[:show,:edit,:update,:destroy]
  before_action :edit_move_to_index,only:[:edit,:update,:destroy]
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
    
  end

  def edit
    
  end

  def update
    
    if @item.update(items_params)
    return redirect_to root_path 
    else
      render :edit
    end
  end
  def destroy
    @item.destroy
    redirect_to root_path
  end

  private
  def items_params
    params.require(:item).permit(:image,:title,:delivery_date_id,:price,:category_id,:product_status_id,:shipping_id,:area_id,:description_item).merge(user_id: current_user.id)
  end
  def edit_move_to_index
    
      unless  current_user.id == @item.user_id
        redirect_to action: :index
    end
  end
  def items_move
    @item = Item.find(params[:id])
  end
end
