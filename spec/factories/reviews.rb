FactoryBot.define do
  factory :review do
    rating { 1 }
    message { "MyText" }
    user { nil }
    listing { nil }
  end
end
