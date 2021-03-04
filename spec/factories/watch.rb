FactoryBot.define do
    factory :watch do
        profile factory: :profile
        listing factory: :listing
    end
end
