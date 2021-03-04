FactoryBot.define do
    factory :profile do
        user factory: :user
        bio { "This is a user bio" }
        postcode { 3000 }
        location { " Melbourne " }
    end
end
