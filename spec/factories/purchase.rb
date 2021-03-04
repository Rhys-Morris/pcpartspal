FactoryBot.define do
    factory :purchase do
        user factory: :user
        listing factory: :listing
        receipt_url { "https://example-receipt-url.com" }
        payment_intent { "payment_string" }
    end
end
