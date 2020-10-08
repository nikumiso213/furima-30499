require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  it 'nickname, email, password, password_confirmation, family_name, first_name, family_name_reading, first_name_reading, birthdayが存在すれば登録できること' do
    expect(@user).to be_valid
  end

  it 'nicknameが空の場合登録できないこと' do
    @user.nickname = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Nickname can't be blank")
  end

  it 'emailが空の場合登録できないこと' do
    @user.email = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Email can't be blank")
  end

  it 'emailに@を含まない場合登録できないこと' do
    @user.email = "testiclud.com"
    @user.valid?
    expect(@user.errors.full_messages).to include("Email is invalid")
  end

  it 'emailが空の場合登録できないこと' do
    @user.email = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Email can't be blank")
  end

  it '重複したemailが存在する場合登録できないこと' do
    @user.save
    another_user = FactoryBot.build(:user)
    another_user.email = @user.email
    another_user.valid?
    expect(another_user.errors.full_messages).to include('Email has already been taken')
  end

  it 'passwordが空の場合登録できないこと' do
    @user.password = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank")
  end

  it 'passwordが6文字以上の場合登録できること' do
    @user.password = 'passw6'
    @user.password_confirmation = 'passw6'
    expect(@user).to be_valid
  end

  it 'passwordが5文字以下の場合登録できないこと' do
    @user.password = 'pass5'
    @user.valid?
    expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
  end

  it 'passwordが半角英数字混合でない場合登録できないこと' do
    @user.password = 'passix'
    @user.valid?
    expect(@user.errors.full_messages).to include('Password は半角英字と数字の両方を含めてください')
  end

  it 'passwordが存在してもpassword_confirmationが存在しない場合登録できないこと' do
    @user.password_confirmation = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end

  it 'family_nameが空の場合登録できないこと' do
    @user.family_name = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Family name can't be blank")
  end

  it 'family_nameが全角文字でない場合登録できないこと' do
    @user.family_name = 'test'
    @user.valid?
    expect(@user.errors.full_messages).to include('Family name 全角文字を入力してください')
  end

  it 'first_nameが空の場合登録できないこと' do
    @user.first_name = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("First name can't be blank")
  end

  it 'first_nameが全角文字でない場合登録できないこと' do
    @user.first_name = 'test'
    @user.valid?
    expect(@user.errors.full_messages).to include('First name 全角文字を入力してください')
  end

  it 'family_name_readingが空の場合登録できないこと' do
    @user.family_name_reading = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Family name reading can't be blank")
  end

  it 'family_name_readingが全角（カタカナ）でない場合場合登録できないこと' do
    @user.family_name_reading = 'ｶﾀｶﾅ'
    @user.valid?
    expect(@user.errors.full_messages).to include('Family name reading 全角（カタカナ）で入力してください')
  end

  it 'first_name_readingが空の場合登録できないこと' do
    @user.first_name_reading = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("First name reading can't be blank")
  end

  it 'first_name_readingが全角（カタカナ）でない場合場合登録できないこと' do
    @user.first_name_reading = 'ｶﾀｶﾅ'
    @user.valid?
    expect(@user.errors.full_messages).to include('First name reading 全角（カタカナ）で入力してください')
  end

  it 'birthdayが空の場合登録できないこと' do
    @user.birthday = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("Birthday can't be blank")
  end
end
