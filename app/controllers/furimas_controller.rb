class FurimasController < ApplicationController
  # ログインしていないユーザーはログインページに促す
  before_action :authenticate_user!, except: [:index, :show]

  # 重複処理をまとめる
  # before_action :set_furima, only: [:show, :edit, :update, :destroy]

  def index
  end

  # def new
    # @furima = Furima.new
  # end

  # def create
    # @furima = Furima.new(furima_params)
    # if @furima.save
      # redirect_to root_path
    # else
      # render :new
    # end
  # end

  # def edit
    # ログインしているユーザーと同一であればeditファイルが読み込まれる
    # if @furima.user_id == current_user.id && @furima.card.nil?
    # else
      # redirect_to root_path
    # end
  # end

  # def update
    # @furima.update(furima_params)
    # バリデーションがOKであれば詳細画面へ
    # if @furima.valid?
      # redirect_to furima_path(furima_params)
    # else
      # NGであれば、エラー内容とデータを保持したままeditファイルを読み込み、エラーメッセージを表示させる
      # render 'edit'
    # end
  # end

  # def show
  # end

  # def destroy
    # ログインしているユーザーと同一であればデータを削除する
    # if @furima.user_id == current_user.id
      # @furima.destroy
      # redirect_to root_path
    # else
      # redirect_to root_path
    # end
  # end

  # private

  # def furima_params
    # params.require(:furima).permit(:user, :name, :description, :category_id, :status_id , :shipping_cost_id, :shipping_day_id, :prefecture_id, :price).merge(user_id: current_user.id)
  # end

  # def set_furima
    # @furima = Furima.find(params[:id])
  # end
end