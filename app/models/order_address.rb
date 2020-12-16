class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_area_id, :city, :house_number, :building_name, :phone_number, :item_id, :token, :user_id, :order_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid. Input 10 or 11  number. (No hyphen required)' }
    validates :token
  end

  validates :shipping_area_id, numericality: { other_than: 0 }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, shipping_area_id: shipping_area_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
