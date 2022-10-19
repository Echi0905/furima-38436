class CardsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :non_purchased_product, only: [:index, :create]

  def index
    @card_form = CardForm.new
  end

  def create
    @card_form = CardForm.new(card_params)
    if @card_form.valid?
      pay_item
      @card_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def card_params
    params.require(:card_form).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @product.price,    # 商品の値段
      card: card_params[:token], # カードトークン
      currency: 'jpy'            # 通貨の種類（日本円）
    )
  end

  def non_purchased_product
    @product = Product.find(params[:product_id])
    redirect_to root_path if current_user.id == @product.user_id || @product.card.present?
  end

end