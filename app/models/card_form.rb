class CardForm
  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :product_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'はハイフン(-)を入力してください' }
    validates :prefecture_id, numericality: { other_than: 0, message: "を選んでください" }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/, message: 'を入力してください' }
    validates :token
  end

  def save
    card = Card.create(user_id: user_id, product_id: product_id)
    Destination.create(card_id: card.id, post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number)
  end
end