class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :prefecture_id, :city, :street_address, :building, :tel, :token

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postcode, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :street_address
    validates :tel, format: { with: /\A\d{10,11}\z/ }
    validates :token
  end

  def save
    # 各テーブルにデータを保存する処理を書く
    purchase_item = PurchaseItem.create(user_id: user_id, item_id: item_id)

    ShippingItem.create(postcode: postcode, prefecture_id: prefecture_id, city: city, street_address: street_address,
                        building: building, tel: tel, purchase_item_id: purchase_item.id)
  end
end
