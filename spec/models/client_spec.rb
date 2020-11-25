require 'rails_helper'

RSpec.describe Client, type: :model do
  before do
    @client = FactoryBot.build(:client)
  end
  describe do
    it '全ての項目が入力されている' do
      expect(@client).to be_valid
    end
    it '画像がなくてもok' do
      @client.image = ""
      expect(@client).to be_valid
    end
    it '備考がなくてもok' do
      @client.remarks = ""
      expect(@client).to be_valid
    end
    context '顧客作成ができない時' do
      it 'nameが未入力' do
        @client.name = ""
        @client.valid?
        expect(@client.errors.full_messages).to include("名前を入力してください")
      end
      it 'ageが未入力' do
        @client.age = ""
        @client.valid?
        expect(@client.errors.full_messages).to include("年齢を入力してください")
      end
      it 'sexが未入力' do
        @client.sex = false
        @client.valid?
        expect(@client.errors.full_messages).to include("性別を入力してください")
      end
      it 'belongingが未入力' do
        @client.belonging = ""
        @client.valid?
        expect(@client.errors.full_messages).to include("所属店舗を入力してください")
      end
      it 'purposeが未入力' do
        @client.purpose = ""
        @client.valid?
        expect(@client.errors.full_messages).to include("目的を入力してください")
      end
      it 'start_timeが未入力' do
        @client.start_time = ""
        @client.valid?
        expect(@client.errors.full_messages).to include("予約日を入力してください")
      end
      it 'start_timeが過去の日付' do
        @client.start_time = "2001-09-09"
        @client.valid?
        expect(@client.errors.full_messages).to include("予約日は今日以降のものを選択してください")
      end
      it 'session_timeが未入力' do
        @client.session_time = ""
        @client.valid?
        expect(@client.errors.full_messages).to include("予約時間を入力してください")
      end
    end
  end
end
