class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to :category
  belongs_to :situation
  belongs_to :delivery
  belongs_to :prefecture
  belongs_to :shipping_day

  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :explanation
    validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :situation_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :delivery_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :shipping_day_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :price
  end

  end
