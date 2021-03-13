FactoryBot.define do
  factory :review do
    rating { 5 }
    message { "Review Message" }
    user factory: :user
    listing factory: :listing
  end
end
