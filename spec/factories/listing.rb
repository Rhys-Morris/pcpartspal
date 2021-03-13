FactoryBot.define do
    factory :listing do
        title { "Samsung Pro Evo Plus 970" }
        description { "Fast read and write times." }
        price { 200.00 }
        sold { false }
        condition { 0 }
        height { 10 }
        width { 10}
        length { 30 }
        weight { 1.5 }
        user factory: :user
        brand factory: :brand
        category factory: :category
    end
end
