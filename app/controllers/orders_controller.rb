class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @order = Order.new(address_params)
  end

  def new
    
  end
  
  def create
    #binding.pry
    @order_address = OrderAddress.new(address_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root to: "items#index"
    else
      render action: :index, alert: @order_address.errors.full_messages
    end
  end

  private

  def address_params
    params.permit(:postal_code, :shipping_area_id, :city, :house_number, :building_name, :phone_number, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: order_params[:price],  
      card: order_params[:token],    
      currency: 'jpy'                 
    )
  end

end
