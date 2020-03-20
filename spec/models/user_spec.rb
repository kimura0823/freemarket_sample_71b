require 'rails_helper'


describe User do
  describe '#create' do
    it "is valid with a nickname, email, password, password_confirmation, first_name, last_name, first_name_kana, last_name_kana, birthday_y, birthday_m, birthday_d," do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without first_name" do
      user = build(:user, first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    it "is invalid without last_name" do
      user = build(:user, last_name: "")
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    it "is invalid without first_name_kana" do
      user = build(:user, first_name_kana: "")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end

    it "is invalid without last_name_kana" do
      user = build(:user, last_name_kana: "")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("can't be blank")
    end

    it "is invalid without birthday_y" do
      user = build(:user, birthday_y: "")
      user.valid?
      expect(user.errors[:birthday_y]).to include("can't be blank")
    end

    it "is invalid without birthday_m" do
      user = build(:user, birthday_m: "")
      user.valid?
      expect(user.errors[:birthday_m]).to include("can't be blank")
    end

    it "is invalid without birthday_d" do
      user = build(:user, birthday_d: "")
      user.valid?
      expect(user.errors[:birthday_d]).to include("can't be blank")
    end

    it "is invalid without a nickname" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "is invalid without a email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid without a password" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "is invalid without a password_confirmation evenif password presence" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "is valid letter of password is under 7 " do
      user = build(:user, nickname: "kuboyu")
      user.valid?
      expect(user.errors[:nickname]).to include("is too long (maximum is 6 characters)")
    end

   

    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end


    it "is valid with a password that has more than 6 characters " do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user).to be_valid
    end

    # 10. passwordが6文字以下であれば登録できないこと
    it "is invalid with a password that has less than 7 characters " do
      user = build(:user, password: "000000", password_confirmation: "000006")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 7 characters)")
    end

  end
end

