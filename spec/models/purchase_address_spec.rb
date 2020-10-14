require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchase_address = FactoryBot.build(:purchase_address)
  end

  it 'すべての値が正しく入力されていれば保存できること' do
    expect(@purchase_address).to be_valid
  end

  it 'buildingが存在していないなくても保存できること' do
    @purchase_address.building = nil
    expect(@purchase_address).to be_valid
  end

  it 'postal_codeが存在していない場合保存できないこと' do
    @purchase_address.postal_code = nil
    @purchase_address.valid?
    expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
  end

  it 'postal_codeにハイフンが含まれていない場合保存できないこと' do
    @purchase_address.postal_code = '123456'
    @purchase_address.valid?
    expect(@purchase_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
  end

  it 'prefecture_idが存在していない場合保存できないこと' do
    @purchase_address.prefecture_id = nil
    @purchase_address.valid?
    expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
  end

  it 'prefecture_idが1の場合保存できないこと' do
    @purchase_address.prefecture_id = 1
    @purchase_address.valid?
    expect(@purchase_address.errors.full_messages).to include('Prefecture must be other than 1')
  end

  it 'cityが存在していない場合保存できないこと' do
    @purchase_address.city = nil
    @purchase_address.valid?
    expect(@purchase_address.errors.full_messages).to include("City can't be blank")
  end

  it 'addressが存在していない場合保存できないこと' do
    @purchase_address.address = nil
    @purchase_address.valid?
    expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
  end

  it 'phone_numberが存在していない場合保存できないこと' do
    @purchase_address.phone_number = nil
    @purchase_address.valid?
    expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
  end

  it 'phone_numberが半角数字でない場合保存できないこと' do
    @purchase_address.phone_number = '０９０１２３４５６７８'
    @purchase_address.valid?
    expect(@purchase_address.errors.full_messages).to include('Phone number は10桁か11桁の半角数字でハイフン(-)なしで入力してください')
  end

  it 'phone_numberが9桁以下の場合保存できないこと' do
    @purchase_address.phone_number = '090123456'
    @purchase_address.valid?
    expect(@purchase_address.errors.full_messages).to include('Phone number は10桁か11桁の半角数字でハイフン(-)なしで入力してください')
  end

  it 'phone_numberが12桁以上の場合保存できないこと' do
    @purchase_address.phone_number = '090123456789'
    @purchase_address.valid?
    expect(@purchase_address.errors.full_messages).to include('Phone number は10桁か11桁の半角数字でハイフン(-)なしで入力してください')
  end

  it 'phone_numberがハイフン(-)を含む場合保存できないこと' do
    @purchase_address.phone_number = '090-1234-5678'
    @purchase_address.valid?
    expect(@purchase_address.errors.full_messages).to include('Phone number は10桁か11桁の半角数字でハイフン(-)なしで入力してください')
  end

  it 'tokenが存在していない場合保存できないこと' do
    @purchase_address.token = nil
    @purchase_address.valid?
    expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
  end
end
