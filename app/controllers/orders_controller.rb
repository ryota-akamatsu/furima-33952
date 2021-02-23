class OrdersController < ApplicationController
  before_action :authenticate_user!,only:[:index,:create]
  before_action :move_to_index,only:[:index]
  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end
  


    def create
     @item = Item.find(params[:item_id])
      @order_address = OrderAddress.new(address_params)
      if @order_address.valid?
        pay_item
        @order_address.save
        redirect_to root_path
        else
          render :index
      end
    end


  private
  def items_params
    params.require(:item).permit(:image,:title,:delivery_date_id,:price,:category_id,:product_status_id,:shipping_id,:area_id,:description_item).merge(user_id: current_user.id)
  end
  
  def order_params
  params.require(:order_address).permit(:user_id,:item_id)
  params.require(:order_address).permit(:price).merge(token: params[:token])
  end

  def address_params
    params.require(:order_address).permit(:item,:postal_code,:area_id,:municipality,:address,:building,:phone_number,:shipping_id,:area_id,:description_item).merge(item_id: params[:item_id] ,user_id: current_user.id)
  end
  def pay_item
    Payjp.api_key = "sk_test_3e83242af98fd98bc0eb4f61"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
  def move_to_index
    @item = Item.find(params[:item_id])
    if  @item.order != nil
        redirect_to controller: :items, action: :index
    end
  end
 
end
