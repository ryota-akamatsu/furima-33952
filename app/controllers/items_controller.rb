class ItemsController < ApplicationController
  before_action :authenticate_user!,except:[:index,:show]
  before_action :items_move,only:[:show,:edit,:update,:destroy]
  before_action :edit_move_to_index,only:[:edit,:update,:destroy]
  before_action :search_item, only: [:index, :search]
  def index
    @item = Item.all.order("created_at DESC")
    set_product_column       
  end

  def new
    
    @item = ItemTagRelation.new
  end

  def create
    
    @item = ItemTagRelation.new(items_params)
    if@item.valid?
      @item.save
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

  def search
    
      @item = @p.result.includes(:category)  
   
    return nil if params[:keyword] == ""
    tag = Tag.where(['name LIKE ?', "%#{params[:keyword]}%"] )
    render json:{ keyword: tag }
  end

  private
  def items_params
    params.require(:item_tag_relation).permit(:title,:delivery_date_id,:price,:category_id,:product_status_id,:shipping_id,:area_id,:description_item,:name ,images: []).merge(user_id: current_user.id)
  end
  def edit_move_to_index
    
    if  current_user.id != @item.user_id || @item.order != nil
        redirect_to action: :index
    end
  end
  def items_move
    @item = Item.find(params[:id])
  end
  def search_item
    @p = Item.ransack(params[:q]) 
  end
  def set_product_column
    @item_title = Item.select("title").distinct  
  end
end
