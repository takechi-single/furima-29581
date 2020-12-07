class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
  end
  
  def create
    #binding.pry
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render action: :index, alert: @order_address.errors.full_messages
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :shipping_area_id, :city, :house_number, :building_name, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      price: order_params[:id],  
      card: order_params[:token],    
      currency: 'jpy'                 
    )
  end

end
