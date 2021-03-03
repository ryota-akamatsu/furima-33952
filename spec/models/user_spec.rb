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
      @user.password ="Aa123456"
      @user.password_confirmation = "Aa123456"
      @user.valid?
      expect(@user).to be_valid
    end

    it "passwordが7文字以上で、英数字の組み合わせであれば登録できること" do
      @user.password = "Aa123456"
      @user.password_confirmation = "Aa123456"
      @user.valid?
      expect(@user).to be_valid
    end
    
  end

  context 'ユーザー新規登録できないとき' do

    it "nicknameがない場合は登録できないこと" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to including("ニックネームを入力してください")
    end

    it "emailがない場合は登録できないこと" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to including("Eメールを入力してください")
    end

    it "emailに@がない場合は登録できないこと " do
      @user.email = "aaaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to including("Eメールは不正な値です")
    end

    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user,email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to including("Eメールはすでに存在します")
    end

    it "passwordがない場合は登録できないこと" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to including("パスワードを入力してください")
    end

    

    it "passwordが6文字以下であれば登録できないこと" do
      @user.password = "12345"
      @user.password_confirmation ="12345"
      @user.valid?
      expect(@user.errors.full_messages).to including("パスワードは6文字以上で入力してください")
    end

  

    it "passwordが英文字のみの場合は登録できないこと" do
      @user.password ="aaaaaaa"
      @user.password_confirmation = "aaaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは不正な値です")
    end

    it "passwordが数文字のみの場合は登録できないこと" do
      @user.password ="1111111"
      @user.password_confirmation = "1111111"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは不正な値です")
    end

    it "password_confirmationがない場合は登録できないこと" do
      @user.password ="a123456"
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end

    it "passwordとpassword_confirmationが一致していない場合は登録できないこと" do
      @user.password ="a123456"
      @user.password_confirmation = "b123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end

    it "first_nameがない場合は登録できないこと" do
    @user.first_name = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("名前を入力してください")

    end

    it "last_nameがない場合は登録できないこと" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("名字を入力してください")
    end

    it "first_name_kanaがない場合は登録できないこと" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("名前カナを入力してください")
    end

    it "last_name_kanaがない場合は登録できないこと" do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("名字カナを入力してください")
    end

    it "last_nameが全角でない場合登録できないこと"do
      @user.last_name = "abe"
      @user.valid?
      expect(@user.errors.full_messages).to include("名字は不正な値です")
  end

  it "first_nameが全角でない場合登録できないこと"do
  @user.first_name = "abe"
  @user.valid?
  expect(@user.errors.full_messages).to include("名前は不正な値です")
end

it "last_nameが全角でない場合登録できないこと"do
      @user.last_name_kana = "abe"
      @user.valid?
      expect(@user.errors.full_messages).to include("名字カナは不正な値です")
  end

  it "first_name_kanaが全角でない場合登録できないこと"do
  @user.first_name_kana = "abe"
  @user.valid?
  expect(@user.errors.full_messages).to include("名前カナは不正な値です")
  end

    it "birthdayがない場合は登録できないこと" do
    @user.birthday = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("生年月日を入力してください")
    end
  end
  

end
