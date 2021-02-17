require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  context'商品出品ができる時'do
    it "title,price,description_item,category_id,shipping_id,area_id,delivery_date_id,imageが存在すれば出品できること"do
      expect(@item).to be_valid
    end
    it "priceが300以上9,9999,999以下であれば出品できること"do
    @item.price = 1111
    @item.valid?
    expect(@item).to be_valid
  end
    it "category_idが1意外なら出品できること"do
    @item.category_id = 2
    expect(@item).to be_valid
    end
    it "sipping_idが1意外なら出品できること"do
    @item.shipping_id = 2
    expect(@item).to be_valid
    end
    it "area_idが1意外なら出品できること"do
    @item.area_id = 2
    expect(@item).to be_valid
    end
    it "delivery_date_idが1意外なら出品できること"do
    @item.delivery_date_id = 2
    expect(@item).to be_valid
    end
  end
  context'商品出品できない時' do
    it "titleがない時は出品できないこと" do
    @item.title = ''
    @item.valid?
    expect(@item.errors.full_messages).to including( "Title Title cant be black")
    end
    it "priceがない時は出品できないこと" do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to including( "Price can't be blank")
    end
    it "priceが300以下の時は出品できないこと" do
      @item.price = '200'
      @item.valid?
      expect(@item.errors.full_messages).to including( "Price out of setting range")
    end
    it "priceが9,9999,999以上の時は出品できないこと" do
      @item.price = '100000000'
      @item.valid?
      expect(@item.errors.full_messages).to including( "Price out of setting range")
    end
    it "description_itemがない時は出品できないこと" do
      @item.description_item = ''
      @item.valid?
      expect(@item.errors.full_messages).to including("Description item Description_item cant be black")
    end
    it "category_idがない時は出品できないこと" do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to including("Category can't be blank")
    end
    it "category_idが1の時は出品できないこと" do
    @item.category_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to including("Category Category cant be black")
    end
    it "shipping_idがない時は出品できないこと" do
    @item.shipping_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to including("Shipping can't be blank")
    end
    it "shipping_idが1の時は出品できないこと" do
      @item.shipping_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to including("Shipping Shipping cant be black")
      end
      it "area_idがない時は出品できないこと" do
      @item.area_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to including("Area can't be blank")
      end
      it "area_idが1の時は出品できないこと" do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to including("Area Area cant be black")
        end
        it "delivery_date_idがない時は出品できないこと" do
        @item.delivery_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to including("Delivery date can't be blank")
        end
        it "delivery_date_idが1の時は出品できないこと" do
          @item.delivery_date_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to including("Delivery date Delivery_date cant be black")
          end
        it "imageがない時は出品できないこと" do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to including("Image Image cant be black")
        end


  end






end
