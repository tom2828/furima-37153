class Item < ApplicationRecord


  # テーブルとのアソシエーション
  belongs_to :user

  # アクティブハッシュとのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee_charge
  belongs_to :prefecture
  belongs_to :shipping_day



  # Active Storageテーブルとのアソシエーション  
  has_one_attached :image

 #バリデーション設定
    validates :user_id,                    presence: true
    validates :image,                      presence: true
    validates :item_name,                       presence: true
    validates :description,                presence: true
    validates :category_id,                presence: true,numericality: { other_than: 0 }
    validates :status_id,                  presence: true,numericality: { other_than: 0 }
    validates :shipping_fee_charge_id,     presence: true,numericality: { other_than: 0 }
    validates :prefecture_id,              presence: true,numericality: { other_than: 0 }
    validates :shipping_day_id,            presence: true,numericality: { other_than: 0 }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },presence: true


end
