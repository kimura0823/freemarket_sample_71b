

FactoryBot.define do
  factory :product do
    name              {"帽子"}
    description       {"珍しい帽子です"}
    category_id       {"323"}
    brand             {"ジャネル"}
    price             {"5400"}
    judge             {'出品中'}
    user_id           {"56"}
    burden_id         {"2"}
    days_id           {"1"}
    prefecture_id     {"5"}
    status_id         {"2"}



    after(:build) do |product|                           #追記
      product.images << build(:image, product: product)  #追記
    end    

  end
end



