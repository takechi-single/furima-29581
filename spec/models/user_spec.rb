require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe '会員情報入力の登録' do
    it 'ニックネーム、メールアドレス、パスワード、氏名、名前(カナ含む)、生年月日を入力すれば保存できること' do
      @user.valid?
      expect(@user).to be_valid
    end
    it 'ニックネームが空だと保存できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'メールアドレスが空だと保存できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'メールアドレスが重複していると保存できないこと' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'メールアドレスに@が含まれていないと保存できないこと' do
      @user.email = 'kokocom'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it 'パスワードが空だと保存できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'パスワードは半角数字だと保存できないこと' do
      @user.password = '００００'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include letters and numbers')
    end
    it 'パスワードは6文字以上必要であること' do
      @user.password = 'aa111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'パスワードは半角英数字混合であること' do
      @user.password = 'aaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'パスワード(確認)はパスワードと同様であること' do
      @user.password_confirmation = 'bbbbbb'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end

  describe 'ユーザー情報の入力' do
    it 'ユーザーの名字入力が必要であること' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'ユーザーの名前入力が必要であること' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'ユーザーの名字（カナ）入力が必要であること' do
      @user.last_name_reading = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name reading can't be blank")
    end
    it 'ユーザーの名前（カナ）入力が必要であること' do
      @user.first_name_reading = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name reading can't be blank")
    end
    it 'ユーザーの名字は全角カタカナ以外では登録できないこと' do
      @user.last_name_reading = 'ｷｸﾀ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name reading Input full-width katakana characters.')
    end
    it 'ユーザーの名前は全角カタカナ以外では登録できないこと' do
      @user.first_name_reading = 'ﾏｻｼ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name reading Input full-width katakana characters.')
    end
    it '生年月日が必要であること' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
