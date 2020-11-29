class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_area_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :house_number
    validates :phone_number
  end
  
  validates :building_name
  validates :shipping_area_id, numericality: { other_than: 0, message: "can't be blank" }

  belongs_to_active_hash :shipping_area, optional: true

  def save
    Address.create(postal_code: postal_code, shipping_area_id: prefecture, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, user_id: user.id)
  end

end