FactoryBot.define do
    factory :listing do
        title { "Samsung Pro Evo Plus 970" }
        description { "Fast read and write times." }
        price { 200 }
        sold { false }
        condition { 0 }
        user factory: :user
        brand factory: :brand
        category factory: :category
    end
end
