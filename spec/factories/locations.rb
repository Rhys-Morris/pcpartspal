FactoryBot.define do
  factory :location do
    postcode { "3429" }
    city { "Sunbury" }
    state { "VIC" }
    latitude { 37.58 }
    longitude { 144.71 }
  end
end
