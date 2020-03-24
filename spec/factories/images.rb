FactoryBot.define do

  factory :image do
    image   {File.open("#{Rails.root}/spec/fixtures/image.jpg")}
    product
  end

end