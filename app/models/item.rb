class Item < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :explanation
    validates :category_id
    validates :situation_id
    validates :delivery_id
    validates :prefecture_id
    validates :shipping_day_id
    validates :price
  end

  end
