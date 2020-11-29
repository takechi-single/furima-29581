class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_confirm, only: [:edit, :destroy]

  def index
    @items = Item.includes(:user).order('created_at DESC').limit(3)
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
      render action: :new, alert: @item.errors.full_messages
    end
  end

  def show
    
  end

  def edit
  end

  def update
    @item.update(item_params)
    if @item.valid?
      redirect_to action: :index
    else
      render action: :edit, alert: @item.errors.full_messages
    end
  end

  def destroy
    @item.destroy
    redirect_to action: :index
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :image, :price, :category_id, :status_id, :shipping_charge_id, :shipping_area_id, :shipping_date_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_confirm
    redirect_to action: :index if current_user.id != @item.user_id
  end
end
