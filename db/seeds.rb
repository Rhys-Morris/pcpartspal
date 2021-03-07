# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

#  Get information on all Australian suburbs
def get_locations
    response = Faraday.get("https://raw.githubusercontent.com/michalsn/australian-suburbs/master/data/suburbs.json")
    parsed_response = JSON.parse(response.body)

    # puts "--------------"
    # puts parsed_response

    parsed_response["data"]
end

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

if Location.all.empty?
    locations = get_locations
    locations.each do |location|
        postcode = location["postcode"]
        city = location["suburb"]
        state = location["state"]
        lat = location["lat"]
        lng = location["lng"]

        # Remove weird leading string for some ACT suburbs
        leading_string = "ACT Remainder - "
        city.gsub(/#{leading_string}/, "")

        # Save location
        seeded_location = Location.new("postcode": postcode, "city": city,
             "state": state, "latitude": lat, "longitude": lng)
        if seeded_location.save
            puts "Created #{city} in locations"
        end
    end
end
