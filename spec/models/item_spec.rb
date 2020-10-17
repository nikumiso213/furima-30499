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
    expect(@item.errors.full_messages).to include("商品名を入力してください")
  end

  it 'descriptionが存在していない場合保存できないこと' do
    @item.description = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("商品の説明を入力してください")
  end

  it 'category_idが存在していない場合保存できないこと' do
    @item.category_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
  end

  it 'category_idが1の場合保存できないこと' do
    @item.category_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include('カテゴリーを選択してください')
  end

  it 'status_idが存在していない場合保存できないこと' do
    @item.status_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("商品の状態を入力してください")
  end

  it 'status_idが1の場合保存できないこと' do
    @item.status_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include('商品の状態を選択してください')
  end

  it 'shopping_fee_idが存在していない場合保存できないこと' do
    @item.shopping_fee_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
  end

  it 'shopping_fee_idが1の場合保存できないこと' do
    @item.shopping_fee_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include('配送料の負担を選択してください')
  end

  it 'prefecture_idが存在していない場合保存できないこと' do
    @item.prefecture_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("発送元の地域を入力してください")
  end

  it 'prefecture_idが1の場合保存できないこと' do
    @item.prefecture_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include('発送元の地域を選択してください')
  end

  it 'delivery_schedule_idが存在していない場合保存できないこと' do
    @item.delivery_schedule_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
  end

  it 'delivery_schedule_idが1の場合保存できないこと' do
    @item.delivery_schedule_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include('発送までの日数を選択してください')
  end

  it 'priceが存在していない場合保存できないこと' do
    @item.price = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("価格を入力してください")
  end

  it 'priceが299以下の場合保存できないこと' do
    @item.price = 299
    @item.valid?
    expect(@item.errors.full_messages).to include('価格は300~9,999,999の間の数値を入力してください')
  end

  it 'priceが10000000以上の場合保存できないこと' do
    @item.price = 10_000_000
    @item.valid?
    expect(@item.errors.full_messages).to include('価格は300~9,999,999の間の数値を入力してください')
  end

  it 'priceが半角数字でない場合保存できないこと' do
    @item.price = '１２３４５６７'
    @item.valid?
    expect(@item.errors.full_messages).to include("価格は300~9,999,999の間の数値を入力してください")
  end

  it 'imageが存在していない場合保存できないこと' do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("画像ファイルを添付してください")
  end

  it 'userと紐づいていない場合保存できないこと' do
    @item.user = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Userを入力してください")
  end
end
