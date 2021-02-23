class OrdersController < ApplicationController
  before_action :authenticate_user!,only:[:index,:create]
  before_action :move_to_index,only:[:index,:create]
  def index
    
    @order_address = OrderAddress.new
  end
  


    def create
     
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


  def address_params
    params.require(:order_address).permit(:item,:postal_code,:area_id,:municipality,:address,:building,:phone_number,:shipping_id,:area_id,:description_item).merge(token: params[:token],item_id: params[:item_id] ,user_id: current_user.id)
  end
  def pay_item
    Payjp.api_key =  ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  
      card: address_params[:token],    
      currency: 'jpy'                 
    )
  end
  def move_to_index
    @item = Item.find(params[:item_id])
    if  @item.order != nil || current_user.id == @item.user_id
        redirect_to controller: :items, action: :index
    end
  end
 
end
