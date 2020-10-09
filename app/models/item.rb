class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :delivery_schedule
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shopping_fee
  belongs_to_active_hash :status
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :description
    validates :category_id, numericality: { other_than: 1 }
    validates :status_id, numericality: { other_than: 1 }
    validates :shopping_fee_id, numericality: { other_than: 1 }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :delivery_schedule_id, numericality: { other_than: 1 }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than: 10_000_000 }, format: { with: /\A[0-9]+\z/, message: 'は半角数字で入力してください' }
    validates :image
  end
end
