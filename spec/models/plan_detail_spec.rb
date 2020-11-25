require 'rails_helper'

RSpec.describe PlanDetail, type: :model do
  before do
    @plan_detail = FactoryBot.build(:plan_detail)
  end

  describe "plan_detailが保存できる" do
    it "全ての項目が入力されている" do
      expect(@plan_detail).to be_valid
    end
    it "cardioが未入力でもok" do
      @plan_detail.cardio = ""
      expect(@plan_detail).to be_valid
    end
    it "cardio_timeが未入力でもok" do
      @plan_detail.cardio_time = ""
      expect(@plan_detail).to be_valid
    end
    context "登録できない時" do
      it "subjectがない時" do
        @plan_detail.subject = ""
        @plan_detail.valid?
        expect(@plan_detail.errors.full_messages).to include("種目を入力してください")
      end
      it "weightがない時" do
        @plan_detail.weight = ""
        binding.pry
        @plan_detail.valid?
        expect(@plan_detail.errors.full_messages).to include("重量を入力してください")
      end
      it "setがない時" do
        @plan_detail.set = ""
        @plan_detail.valid?
        expect(@plan_detail.errors.full_messages).to include("セット数を入力してください")
      end
      it "repがない時" do
        @plan_detail.rep = ""
        @plan_detail.valid?
        expect(@plan_detail.errors.full_messages).to include("回数を入力してください")
      end
    end

  end
end
