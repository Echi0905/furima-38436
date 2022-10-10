class FurimasController < ApplicationController
  # ログインしていないユーザーはログインページに促す
  before_action :authenticate_user!, except: [:index, :show]

  def index
    # @furimas = Furimas.includes(:user).order('created_at DESC')
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:user, :name, :description, :category_id, :status_id , :shipping_cost_id, :shipping_day_id, :prefecture_id, :price).merge(user_id: current_user.id)
  end
end