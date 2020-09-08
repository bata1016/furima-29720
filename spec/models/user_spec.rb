require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe "ユーザー情報" do
    it 'ニックネームが必須であること' do
      @user.nick_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nick name can't be blank")
    end
    it 'メールアドレスが必須であること' do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
      
    end
    it 'メールアドレス一意性であること' do #エラー起こらず。実際に使うとバリデーションあり
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it 'パスワードが必須であること' do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'パスワードは6文字以上であること' do
      @user.password = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it 'パスワードは半角英数混合であること' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
    end
    it 'パスワードは確認用を含めて二回入力すること' do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end

  describe"本人情報確認" do  
     it "ユーザー本名が、名字が必須であること" do
      @user.first_name = ""
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank","Last name can't be blank")
     end
     it "ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること" do
      @user.last_name = 'aaaa'
      @user.first_name = 'bbb'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name Full-width characters", "First name Full-width characters")
     end
     it "ユーザー本名のフリガナが、名字と名前でそれぞれ必須であること" do
      @user.first_name_kana = ""
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank", "First name kana can't be blank")
     end

     it "ユーザー本名のフリガナは全角（カタカナ）で入力させること" do #エラー起こらず
      @user.first_name_kana = "かた"
      @user.last_name_kana = "かな"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana Full-width katakana", "First name kana Full-width katakana")
     end

     it "生年月日が必須であること" do
      @user.birth_day = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
     end
  end
end
