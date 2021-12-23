class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to :category
  belongs_to :situation
  belongs_to :delivery
  belongs_to :prefecture
  belongs_to :shipping_day

  has_one_attached :image

  validate :was_attached
  with_options presence: true do
    validates :name
    validates :explanation
    validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :situation_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :delivery_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :shipping_day_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :price,
              numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                              message: 'is out of setting range' }
  end

  private

  def was_attached
    errors.add(:image, "can't be blank") unless image.attached?
  end
end
