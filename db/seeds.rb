# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = ['Power Supply', 'Graphics Cards', 'CPUs', 'Memory',
              'Hard Drives and SSDs', 'Cases', 'Cooling', 'Motherboards', 'Mice & Keyboards', 'Monitors']
brands = ['Cooler Master', 'Logitech', 'Corsair', 'Thermaltake', 'Fractal', 'MSI', 'AMD', 'Intel', 'Nvidia',
          'ASUS', 'Lenovo', 'Gigabyte', 'Dell', 'ASRock', 'Razer', 'BenQ', 'G.Skill', 'Samsung', 'Seagate', 'Western Digital',
          'Sapphire', 'XFX', 'EVGA' ]

if Category.all.empty?
    categories.each do |category|
        seeded_category = Category.new("name": category)
        if seeded_category.save
            puts "Created #{category} category"
        end
    end
end

if Brand.all.empty?
    brands.each do |brand|
        seeded_brand = Brand.new("name": brand)
        if seeded_brand.save
            puts "Created #{brand} brand"
        end
    end
end