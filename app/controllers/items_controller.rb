class ItemsController < ApplicationController
def index
  @item = Item.all

end

def new
 @item = Item.new

end
def create

end
private
def items_params
  params.require(:item).permit(:image).merge(user_id: current_user.id)

end

end
