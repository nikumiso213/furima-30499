class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  with_options presence: true , format: {with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "全角文字を入力してください"} do 
    validates :family_name, presence: true
    validates :first_name, presence: true
  end
  with_options presence: true, format: {with: /\A[ァ-ン]+\z/, message: "全角（カタカナ）で入力してください"} do
    validates :family_name_reading, presence: true
    validates :first_name_reading, presence: true
  end
  validates :birthday, presence: true
 end
