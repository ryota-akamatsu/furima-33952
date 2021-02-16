require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

 context 'ユーザー新規登録できるとき' do
    it "nickname、first_name、last_name、first_kana、last_kana、email、password、password_confirmation、birthdayが存在すれば登録できること" do
    expect(@user).to be_valid
    end
    
    it "passwordが7文字以上であれば登録できること" do
      @user.password ="a123456"
      @user.password_confirmation = "a123456"
      @user.valid?
      expect(@user).to be_valid
    end

    it "passwordが7文字以上で、英数字の組み合わせであれば登録できること" do
      @user.password = "a123456"
      @user.password_confirmation = "a123456"
      @user.valid?
      expect(@user).to be_valid
    end
    
  end

  context 'ユーザー新規登録できないとき' do

    it "nicknameがない場合は登録できないこと" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to including("Nickname can't be blank")
    end

    it "emailがない場合は登録できないこと" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to including("Email can't be blank")
    end

    it "emailに@がない場合は登録できないこと " do
      @user.email = "aaaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to including("Email is invalid")
    end

    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user,email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to including("Email has already been taken")
    end

    it "passwordがない場合は登録できないこと" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to including("Password can't be blank")
    end

    

    it "passwordが6文字以下であれば登録できないこと" do
      @user.password = "12345"
      @user.password_confirmation ="12345"
      @user.valid?
      expect(@user.errors.full_messages).to including("Password is too short (minimum is 6 characters)")
    end

  

    it "passwordが英文字のみの場合は登録できないこと" do
      @user.password ="aaaaaaa"
      @user.password_confirmation = "aaaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it "passwordが数文字のみの場合は登録できないこと" do
      @user.password ="1111111"
      @user.password_confirmation = "1111111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it "password_confirmationがない場合は登録できないこと" do
      @user.password ="a123456"
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "passwordとpassword_confirmationが一致していない場合は登録できないこと" do
      @user.password ="a123456"
      @user.password_confirmation = "b123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "first_nameがない場合は登録できないこと" do
    @user.first_name = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("First name first name cant be black")

    end

    it "last_nameがない場合は登録できないこと" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name last name cant be black")
    end

    it "first_name_kanaがない場合は登録できないこと" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana first name kana cant be black")
    end

    it "last_name_kanaがない場合は登録できないこと" do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana last name kana cant be black")
    end

    it "last_nameが全角でない場合登録できないこと"do
      @user.last_name = "abe"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name first name cant be black")
  end

  it "first_nameが全角でない場合登録できないこと"do
  @user.first_name = "abe"
  @user.valid?
  expect(@user.errors.full_messages).to include("First name first name cant be black")
end

it "last_nameが全角でない場合登録できないこと"do
      @user.last_name_kana = "abe"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana Full-width characters")
  end

  it "first_name_kanaが全角でない場合登録できないこと"do
  @user.first_name_kana = "abe"
  @user.valid?
  expect(@user.errors.full_messages).to include("First name kana Full-width characters")
  end

    it "birthdayがない場合は登録できないこと" do
    @user.birthday = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
  

end
