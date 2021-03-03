FactoryBot.define do
  factory :item do
    title             {"南"}
    price             {10000}
    description_item  {Faker::Lorem.sentence}
    category_id       {6}
    product_status_id {2}
    shipping_id       {2}
    area_id           {16}
    delivery_date_id  {2}
    
    association :user
    after(:build) do |item|
      item.images.attach(io: File.open('spec/fixtures/test_image.png'), filename: 'test_image.png')
    end

  end
end
