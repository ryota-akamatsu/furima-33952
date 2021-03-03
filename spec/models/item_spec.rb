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
    it "category_idが1以外なら出品できること"do
    @item.category_id = 2
    expect(@item).to be_valid
    end
    it "sipping_idが1以外なら出品できること"do
    @item.shipping_id = 2
    expect(@item).to be_valid
    end
    it "area_idが1以外なら出品できること"do
    @item.area_id = 2
    expect(@item).to be_valid
    end
    it "delivery_date_idが1以外なら出品できること"do
    @item.delivery_date_id = 2
    expect(@item).to be_valid
    end
  end
  context'商品出品できない時' do
    it "titleがない時は出品できないこと" do
    @item.title = ''
    @item.valid?
    expect(@item.errors.full_messages).to including( "商品名を入力してください")
    end
    it "priceがない時は出品できないこと" do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to including("価格を入力してください")
    end
    it "priceが300以下の時は出品できないこと" do
      @item.price = 200
      @item.valid?
      expect(@item.errors.full_messages).to including("価格は一覧にありません")
    end
    it "priceが9,9999,999以上の時は出品できないこと" do
      @item.price = 100000000
      @item.valid?
      expect(@item.errors.full_messages).to including("価格は一覧にありません")
    end
    it "priceが英語だけの時は出品できないこと" do
      @item.price = 'abcd'
      @item.valid?
      expect(@item.errors.full_messages).to including("価格は数値で入力してください")
    end
    it "priceが半角英数混合の時は出品できないこと" do
      @item.price = 'ab1000'
      @item.valid?
      expect(@item.errors.full_messages).to including("価格は数値で入力してください")
    end
    it "priceが全角の時は出品できないこと" do
      @item.price = '１０００'
      @item.valid?
      expect(@item.errors.full_messages).to including( "価格は数値で入力してください")
    end
    it "description_itemがない時は出品できないこと" do
      @item.description_item = ''
      @item.valid?
      expect(@item.errors.full_messages).to including("商品説明を入力してください")
    end
    it "category_idがない時は出品できないこと" do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to including("カテゴリーは数値で入力してください")
    end
    it "category_idが1の時は出品できないこと" do
    @item.category_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to including("カテゴリーは1以外の値にしてください")
    end
    it "shipping_idがない時は出品できないこと" do
    @item.shipping_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to including("送料は数値で入力してください")
    end
    it "shipping_idが1の時は出品できないこと" do
      @item.shipping_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to including("送料は1以外の値にしてください")
      end
      it "area_idがない時は出品できないこと" do
      @item.area_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to including("都道府県は数値で入力してください")
      end
      it "area_idが1の時は出品できないこと" do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to including("都道府県は1以外の値にしてください")
        end
        it "delivery_date_idがない時は出品できないこと" do
        @item.delivery_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to including("発送日は数値で入力してください")
        end
        it "delivery_date_idが1の時は出品できないこと" do
          @item.delivery_date_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to including("発送日は1以外の値にしてください")
          end
        it "imageがない時は出品できないこと" do
          @item.images = nil
          @item.valid?
          expect(@item.errors.full_messages).to including("画像を入力してください")
        end


  end






end
