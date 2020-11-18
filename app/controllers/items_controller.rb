class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
    Item.save
  end

  def show
    
  end

  def edit
    
  end

  private
  
  def item_params
    params.require(:item).permit(:name, :text, :price).merge(user_id: current_user.id)
  end

end
