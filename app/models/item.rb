class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :name 
    validates :text
    validates :price
    validates :image
    validates :category_id
    validates :status_id
    validates :shipping_charge_id
    validates :shipping_area_id
    validates :shipping_date_id
  end

  belongs_to :user, optional: true
  has_one :order
  has_one_attached :image
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_charge
  belongs_to :shipping_area
  belongs_to :shipping_date
end
