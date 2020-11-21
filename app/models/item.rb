class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  

  with_options presence: true do
    validates :name 
    validates :text
    validates :price, numericality: { only_integer: true, message: "is invalid. Input half-width characters." }
  end
  validates :price, numericality: { greater_than_or_equal_to: 3, less_than_or_equal_to: 9999999, message: "is out of setting range"}

  with_options numericality: { other_than: 0 } do
  validates :shipping_area_id
  validates :shipping_charge_id
  validates :shipping_date_id
  validates :category_id
  validates :status_id
  end

  belongs_to :user, optional: true
  has_one :order
  has_one_attached :image
  belongs_to :category, optional: true
  belongs_to :status, optional: true
  belongs_to :shipping_charge, optional: true
  belongs_to :shipping_area, optional: true
  belongs_to :shipping_date, optional: true
end
