require 'rails_helper'

RSpec.describe Plan, type: :model do
  before do
    @plan = FactoryBot.build(:plan)
  end
  describe "トレーニングプランを登録できる時" do
    it "全ての項目が入力されている" do
      expect(@plan).to be_valid
    end
    it "cautionは未記入でもok" do
      @plan.caution = ""
      expect(@plan).to be_valid
    end
    context "登録ができない時" do 
      it "titleが未記入" do
        @plan.title = ""
        @plan.valid?
        expect(@plan.errors.full_messages).to include("タイトルを入力してください")
      end
      it "descriptionが未記入" do
        @plan.description = ""
        @plan.valid?
        expect(@plan.errors.full_messages).to include("説明を入力してください")
      end
    end
  end
end
