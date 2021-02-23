require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address,user_id:user.id,item_id:item.id)
    sleep 1
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
      expect(@order_address.errors.full_messages).to including("Postal code can't be blank")
    end
    it "postal_codeが3−4桁でない時は購入できない"do
      @order_address.postal_code = '12-3455'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to including("Postal code is invalid. Include hyphen(-)")
    end
    it "postal_codeが数字でないときは購入できない" do
      @order_address.postal_code = 'abc-abcd'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to  including("Postal code is invalid. Include hyphen(-)")
   end
   it "area_idがないと購入できない" do
      @order_address.area_id = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to including("Area can't be blank")
   end
   it "area_idが1だとと購入できない" do
    @order_address.area_id = 1
    @order_address.valid?
    expect(@order_address.errors.full_messages).to including("Area must be other than 1")
   end
    it "municipalityがないと購入できない"do
      @order_address.municipality = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to  including("Municipality can't be blank")
    end
    it "addressがないと購入できない"do
      @order_address.address = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to including("Address can't be blank")
    end
    it "phone_numberががないと購入できない" do
      @order_address.phone_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to including("Phone number can't be blank")
  
      end
    it "phone_numberが10文字以下だと購入できない" do
    @order_address.phone_number = '123456789'
    @order_address.valid?
    expect(@order_address.errors.full_messages).to including("Phone number is invalid")
    end
    it "phone_numberが10文字以下だと購入できない" do
      @order_address.phone_number = '123456789012'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to including("Phone number is invalid")
      end
      it "user_idがない時は購入できない" do
      @order_address.user_id = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to including("User can't be blank")
      end
      it "item_idがない時は購入できない" do
        @order_address.item_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to including("Item can't be blank")
        end
        it "tokenがない時は購入できない" do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to including("Token can't be blank")
        end

  end


end
