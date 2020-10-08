class Item < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  with_options presence: true  do
    validates :name
    validates :description
    validates :category_id
    validates :status_id
    validates :shopping_fee_id
    validates :prefecture_id
    validates :delivery_schedule_id
    validates :price, numericality: {greater_than_or_equal_to: 300, less_than: 10000000}, format: {with: /\A[0-9]+\z/, message: "は半角数字で入力してください"}
  end
end
