class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]

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
    @item = Item.find(params[:id])
  end

  def edit
  end

  def destroy
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :image, :price, :category_id, :status_id, :shipping_charge_id, :shipping_area_id, :shipping_date_id).merge(user_id: current_user.id)
  end
end
