require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  it 'name, description, category_id, status_id, shopping_fee_id, prfecture_id, delivery_schedule_id, price, imageが存在してれば保存できること' do
    expect(@item).to be_valid
  end

  it 'nameが存在していない場合保存できないこと' do
    @item.name = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Name can't be blank")
  end

  it 'descriptionが存在していない場合保存できないこと' do
    @item.description = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Description can't be blank")
  end

  it 'category_idが存在していない場合保存できないこと' do
    @item.category_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Category can't be blank")
  end

  it 'category_idが1の場合保存できないこと' do
    @item.category_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include('Category must be other than 1')
  end

  it 'status_idが存在していない場合保存できないこと' do
    @item.status_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Status can't be blank")
  end

  it 'status_idが1の場合保存できないこと' do
    @item.status_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include('Status must be other than 1')
  end

  it 'shopping_fee_idが存在していない場合保存できないこと' do
    @item.shopping_fee_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Shopping fee can't be blank")
  end

  it 'shopping_fee_idが1の場合保存できないこと' do
    @item.shopping_fee_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include('Shopping fee must be other than 1')
  end

  it 'prefecture_idが存在していない場合保存できないこと' do
    @item.prefecture_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Prefecture can't be blank")
  end

  it 'prefecture_idが1の場合保存できないこと' do
    @item.prefecture_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
  end

  it 'delivery_schedule_idが存在していない場合保存できないこと' do
    @item.delivery_schedule_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Delivery schedule can't be blank")
  end

  it 'delivery_schedule_idが1の場合保存できないこと' do
    @item.delivery_schedule_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include('Delivery schedule must be other than 1')
  end

  it 'priceが存在していない場合保存できないこと' do
    @item.price = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Price can't be blank")
  end

  it 'priceが299以下の場合保存できないこと' do
    @item.price = 299
    @item.valid?
    expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
  end

  it 'priceが10000000以上の場合保存できないこと' do
    @item.price = 10_000_000
    @item.valid?
    expect(@item.errors.full_messages).to include('Price must be less than 10000000')
  end

  it 'priceが半角数字でない場合保存できないこと' do
    @item.price = '１２３４５６７'
    @item.valid?
    expect(@item.errors.full_messages).to include('Price is not a number')
  end

  it 'imageが存在していない場合保存できないこと' do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Image can't be blank")
  end

  it 'userと紐づいていない場合保存できないこと' do
    @item.user = nil
    @item.valid?
    expect(@item.errors.full_messages).to include('User must exist')
  end
end
