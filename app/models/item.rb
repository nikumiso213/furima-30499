class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :delivery_schedule
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shopping_fee
  belongs_to_active_hash :status
  belongs_to :user
  has_one_attached :image
  has_one :purchase

  validate :image_presence
  with_options presence: true do
    validates :name
    validates :description
    validates :category_id, numericality: { other_than: 1, message: 'を選択してください'}
    validates :status_id, numericality: { other_than: 1, message: 'を選択してください'}
    validates :shopping_fee_id, numericality: { other_than: 1, message: 'を選択してください'}
    validates :prefecture_id, numericality: { other_than: 1, message: 'を選択してください'}
    validates :delivery_schedule_id, numericality: { other_than: 1, message: 'を選択してください'}
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than: 10_000_000, message: 'は300~9,999,999の間の数値を入力してください'}, format: { with: /\A[0-9]+\z/, message: 'は半角数字で入力してください' }
  end

  def image_presence
    unless image.attached?
      errors.add(:image, 'ファイルを添付してください')
    end
  end
end
