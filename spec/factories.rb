FactoryGirl.define do
  factory :product do
    code "random_product"
    name "Random Product"
    price 0

    trait :small do
      code "ult_small"
      name "Unlimited 1GB"
      price 24.90
    end

    trait :medium do
      code "ult_medium"
      name "Unlimited 2GB"
      price 29.90
    end

    trait :large do
      code "ult_large"
      name "Unlimited 5GB"
      price 44.90
    end

    trait :one_gb do
      code "one_gb"
      name "1GB Data-pack"
      price 9.90
    end
  end
end
