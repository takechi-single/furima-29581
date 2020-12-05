class Address < ApplicationRecord
  belongs_to :user 
  belongs_to_active_hash :shipping_area, optional: true
end
