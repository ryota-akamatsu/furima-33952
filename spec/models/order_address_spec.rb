require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address,user_id:user.id,item_id:item.id)
    sleep(1)
  end
  context '商品が購入できる時' do
    it "postal_code,area_id,municipality,address,phone_number,user_id,item_id,tokenが存在すれば購入できる" do
    expect(@order_address).to be_valid
    end
    it "postl_codeが3文字ー4文字であれば購入できる" do
      @order_address.postal_code = "123-1234"
      @order_address.valid?
      expect(@order_address).to be_valid
    end
    it "area_idが1以外なら購入できる" do
      @order_address.area_id = 2
      @order_address.valid?
      expect(@order_address).to be_valid
    end
    it "phone_numberが10〜11文字の数字であれば購入できる" do
      @order_address.phone_number = "12345678901"
      @order_address.valid?
      expect(@order_address).to be_valid
    end
    it "建物名がなくても購入できる"do
      @order_address.building = ''
      @order_address.valid?
      expect(@order_address).to be_valid
    end
  end
  context '商品購入できない時'do
    it "postal_codeがないとき購入できない" do
      @order_address.postal_code = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to including("郵便番号を入力してください")
    end
    it "postal_codeが3−4桁でない時は購入できない"do
      @order_address.postal_code = '12-3455'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to including("郵便番号は不正な値です")
    end
    it "postal_codeが数字でないときは購入できない" do
      @order_address.postal_code = 'abc-abcd'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to  including("郵便番号は不正な値です")
   end
   it "area_idがないと購入できない" do
      @order_address.area_id = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to including("都道府県を入力してください")
   end
   it "area_idが1だとと購入できない" do
    @order_address.area_id = 1
    @order_address.valid?
    expect(@order_address.errors.full_messages).to including("都道府県は1以外の値にしてください")
   end
    it "municipalityがないと購入できない"do
      @order_address.municipality = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to  including("市区町村を入力してください")
    end
    it "addressがないと購入できない"do
      @order_address.address = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to including("番地を入力してください")
    end
    it "phone_numberががないと購入できない" do
      @order_address.phone_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to including("電話番号を入力してください")
  
      end
    it "phone_numberが10文字以下だと購入できない" do
    @order_address.phone_number = '123456789'
    @order_address.valid?
    expect(@order_address.errors.full_messages).to including("電話番号は不正な値です")
    end
    it "phone_numberが10文字以下だと購入できない" do
      @order_address.phone_number = '123456789012'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to including("電話番号は不正な値です")
      end
      it "user_idがない時は購入できない" do
      @order_address.user_id = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to including("ユーザーを入力してください")
      end
      it "item_idがない時は購入できない" do
        @order_address.item_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to including("商品を入力してください")
        end
        it "tokenがない時は購入できない" do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to including("カード情報を入力してください")
        end

  end


end
