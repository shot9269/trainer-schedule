require 'rails_helper'
RSpec.describe Trainer, type: :model do
  before do
    @trainer = FactoryBot.build(:trainer)
  end
  describe 'トレーナーの新規登録' do
    it '全ての項目が入力されてる' do
      expect(@trainer).to be_valid
    end
    it '名前が入力されていないと登録できない' do
      @trainer.name = ""
      @trainer.valid?
      expect(@trainer.errors.full_messages).to include("名前を入力してください")
    end
    it '所属店舗が入力されていないと入力できない' do
      @trainer.belonging = ""
      @trainer.valid?
      expect(@trainer.errors.full_messages).to include("所属店舗を入力してください")
    end
    it '活動エリアが入力されていないと入力できない' do
      @trainer.area = ""
      @trainer.valid?
      expect(@trainer.errors.full_messages).to include("活動地域を入力してください")
    end
    it 'メールアドレスが重複していない' do
      @trainer.save
      trainer2 = Trainer.new(name:"aaa",belonging:"aaa",area:"aaa",email:"111@com",password:"fdaaffa11",password_confirmation:"fdaaffa11")
      trainer2.valid?
      expect(trainer2.errors.full_messages).to include("メールはすでに存在します")
    end
    it 'パスワードが６文字以下だといけない' do
      @trainer.password = "fdf"
      @trainer.valid?
      expect(@trainer.errors.full_messages).to include("パスワードは6文字以上で入力してください")
    end
    it 'パスワードと確認が一致していないといけない' do
      @trainer.password_confirmation = "fdfaff"
      @trainer.valid?
      expect(@trainer.errors.full_messages).to include("確認とパスワードの入力が一致しません")
    end
  end

end
