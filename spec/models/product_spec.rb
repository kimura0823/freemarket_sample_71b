require 'rails_helper'
require 'faker'

describe Product do
  describe '#create' do
    it "is valid with a name, description, ctegory_id, brand, price, judge, user_id, burden_id, days_id, prefecture_id, status_id" do
      product = build(:product)
      
      expect(product).to be_valid
    end

    it "is invalid without name" do
      product = build(:product, name: "")
      product.valid?
      expect(product.errors[:name]).to include("を入力してください")
    end

    it "is invalid without description" do
      product = build(:product, description: "")
      product.valid?
      expect(product.errors[:description]).to include("を入力してください")
    end

    it "is invalid without category_id" do
      product = build(:product, category_id: "")
      product.valid?
      expect(product.errors[:category_id]).to include("を入力してください")
    end

    it "is invalid without price" do
      product = build(:product, price: "")
      product.valid?
      expect(product.errors[:price]).to include("を入力してください")
    end

    it "is invalid without burden_id" do
      product = build(:product, burden_id: "")
      product.valid?
      expect(product.errors[:burden_id]).to include("を入力してください")
    end

    it "is invalid without days_id" do
      product = build(:product, days_id: "")
      product.valid?
      expect(product.errors[:days_id]).to include("を入力してください")
    end

    it "is invalid without prefecture_id" do
      product = build(:product, prefecture_id: "")
      product.valid?
      expect(product.errors[:prefecture_id]).to include("を入力してください")
    end

    it "is invalid without a status_id" do
      product = build(:product, status_id: "")
      product.valid?
      expect(product.errors[:status_id]).to include("を入力してください")
    end

    it "is valid without a brand" do
      product = build(:product, brand: "")
      product.valid?
      expect(product).to be_valid
    end



    
  end
end

