require 'rails_helper'

RSpec.describe RecordAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @record_address = FactoryBot.build(:record_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '購入情報が保存できるとき' do
      it '必須事項が全て存在すれば保存できる' do
        expect(@record_address).to be_valid
      end
      it '建物名が空でも保存できる' do
        @record_address.building = ''
        expect(@record_address).to be_valid
      end
    end

    context '購入情報が保存できないとき' do
      it 'post_numberが空では登録できない' do
        @record_address.post_number = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Post number can't be blank")
      end
      it 'area_idの値を選択しなければ登録できない' do
        @record_address.area_id = 1
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Area can't be blank")
      end
      it 'cityが空では登録できない' do
        @record_address.city = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("City can't be blank")
      end
      it 'street_numberが空では登録できない' do
        @record_address.street_number = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Street number can't be blank")
      end
      it 'telephoneが空では登録できない' do
        @record_address.telephone = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Telephone can't be blank")
      end
      it 'post_numberが全角入力では登録できない' do
        @record_address.post_number = '１２３ー４５６７'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Post number is invalid')
      end
      it 'post_numberにハイフンがなければ登録できない' do
        @record_address.post_number = '1234567'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Post number is invalid')
      end
      it 'post_numberはハイフンの前が2桁以下では登録できない' do
        @record_address.post_number = '12-3456'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Post number is invalid')
      end
      it 'post_numberはハイフンの前が4桁以上では登録できない' do
        @record_address.post_number = '01234-567'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Post number is invalid')
      end
      it 'post_numberはハイフンの後が3桁以下では登録できない' do
        @record_address.post_number = '123-456'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Post number is invalid')
      end
      it 'post_numberはハイフンの後が5桁以上では登録登録できない' do
        @record_address.post_number = '123-45678'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Post number is invalid')
      end
      it 'telephoneは全角入力では登録できない' do
        @record_address.telephone = '０９０１２３４５６７８'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Telephone is invalid')
      end
      it 'telephoneは9桁以下では登録できない' do
        @record_address.telephone = ' 090123456'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Telephone is invalid')
      end
      it 'telephoneは12桁以上では登録できない' do
        @record_address.telephone = ' 090123456789'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Telephone is invalid')
      end
      it 'telephoneは半角数値以外が入力されると登録できない' do
        @record_address.telephone = ' 090-1234-5678'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Telephone is invalid')
      end
      it 'userが紐づいていないと登録できない' do
        @record_address.user_id = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていないと登録できない' do
        @record_address.item_id = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では登録できない' do
        @record_address.token = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
