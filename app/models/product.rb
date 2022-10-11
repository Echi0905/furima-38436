class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # テーブルとのアソシエーション
  belongs_to :user
  has_one    :card
  # has_many :comments

  # アクティブハッシュとのアソシエーション
  belongs_to :category
  belongs_to :prefecture
  belongs_to :status
  belongs_to :shipping_cost
  belongs_to :shipping_day

  # active_storageとのアソシエーション
  # （items・active_storage_blobsテーブルを関連付け）
  has_one_attached :image
  
  validates :user_id,           presence: true
  validates :image,             presence: true
  validates :name,              presence: true
  validates :description,       presence: true
  validates :category_id,       presence: true
  validates :status_id,         presence: true
  validates :shipping_cost_id,  presence: true
  validates :prefecture_id,     presence: true
  validates :shipping_day_id,   presence: true    
    # 300円以上かつ9,999,999円以下で、半角数字でないと入力不可
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  # ジャンルの選択が「--」の時は保存不可
  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :prefecture_id
    validates :status_id
    validates :shipping_cost_id
    validates :shipping_day_id
  end
end