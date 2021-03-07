FactoryBot.define do
  factory :location do
    postcode { "MyString" }
    city { "MyString" }
    state { "MyString" }
    latitude { 1 }
    longitude { 1 }
  end
end
