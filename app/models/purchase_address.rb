class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :block, :building, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Postcode can't be blank"}
    validates :city
    validates :block
    validates :phone_number, format: {with: /\A[0-9]{11}\z/, message: "is invalid"}
  end
    validates :prefecture_id, numericality: { other_than: 1 }
  def save(user_id)
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end