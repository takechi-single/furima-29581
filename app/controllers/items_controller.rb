class ItemsController < ApplicationController
  before_action :authenticate_user!, expect:[:index]


  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def show
    
  end

  def edit
    
  end

  private
  
  def item_params
    params.require(:item).permit(:name, :text, :image, :price, :category_id, :status_id, :shipping_charge_id, :shipping_area_id, :shipping_date_id).merge(user_id: current_user.id)
  end

end
