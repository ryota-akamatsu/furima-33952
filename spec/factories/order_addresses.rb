FactoryBot.define do
  factory :order_address do
    postal_code        {"123-4567"}
    area_id            {5}
    municipality       {"柴又"}
    address            {"1-2-3"}
    building           {"アベイル"}
    phone_number       {"12345678901"}
    token              {"a12345"}

   

  end
end
