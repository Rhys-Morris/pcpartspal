FactoryBot.define do
    factory :user do
        email { "test@example.com" }
        username { "Test_User" }
        password { "password" }
        password_confirmation { "password" }
        location factory: :location
    end
end
