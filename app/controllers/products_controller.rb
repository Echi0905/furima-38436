class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :check_current_user, only: [:edit, :update]
  before_action :move_to_index, except: [:index, :show]

  def index
    @products = Product.includes(:user).order('created_at DESC')
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

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product.id)
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to action: :index
  end

  private

  def product_params
    params.require(:product).permit(:user_id, :image, :name, :description, :category_id, :status_id, :shipping_cost_id,
                                    :prefecture_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def check_current_user
    redirect_to action: :index if user_signed_in? && @product.user_id != current_user.id
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end
end
