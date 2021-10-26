require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品情報の保存' do
    context '商品情報が保存できるとき' do
      it '必須事項が全て存在すれば保存できる' do
        expect(@item).to be_valid
      end
    end
    context '商品情報が保存できないとき' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages). to include("Item name can't be blank")
      end
      it 'item_textが空では登録できない' do
        @item.item_text = ''
        @item.valid?
        expect(@item.errors.full_messages). to include("Item text can't be blank")
      end
      it 'category_idが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages). to include("Category can't be blank")
      end
      it 'condition_idが空では登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages). to include("Condition can't be blank")
      end
      it 'postage_idが空では登録できない' do
        @item.postage_id = ''
        @item.valid?
        expect(@item.errors.full_messages). to include("Postage can't be blank")
      end
      it 'area_idが空では登録できない' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages). to include("Area can't be blank")
      end
      it 'days_idが空では登録できない' do
        @item.days_id = ''
        @item.valid?
        expect(@item.errors.full_messages). to include("Days can't be blank")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages). to include("Price can't be blank")
      end
      it 'priceが全角数字では登録できない' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages). to include("Price is invalid")
      end
      it 'priceが299円以下だと登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages). to include("Price is invalid")
      end
      it 'priceが10,000,000円以上では登録できない' do
        @item.price = '10_000_000'
        @item.valid?
        expect(@item.errors.full_messages). to include("Price is invalid")
      end
    end
  end
end
