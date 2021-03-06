require 'faraday'

module ApplicationHelper
    def user_listing_count(user)
        count = Listing.where("user_id": user.id, "sold": false).count
        if count == 1
            "#{count} listing for sale"
        else
            "#{count} listings for sale"
        end
    end

    def listing_count(listings)
        if listings.count == 1
            "1 listing"
        else
            "#{listings.count} listings"
        end
    end

    def format_title(title)
        if title.length > 45
            title[0..42] + "..."
        else
            title
        end
    end

    def get_coords(postcode)
        response = Faraday.get("http://api.beliefmedia.com/postcodes/#{postcode}.json")
        parsed_response = JSON.parse(response.body)
  
        # puts "--------------"
        # puts parsed_response
  
        coords = {lat: parsed_response["data"]["latitude"], long: parsed_response["data"]["longitude"]}
      end

    def get_distance(start, finish)
        start_lat = start[:lat]
        start_long = start[:long]
        finish_lat = finish[:lat]
        finish_long = finish[:long]

        response = Faraday.get("https://distance-calculator.p.rapidapi.com/distance/simple?lat_1=#{start_lat}&long_1=#{start_long}&lat_2=#{finish_lat}&long_2=#{finish_long}&unit=kilometers") do |req|
            req.headers["x-rapidapi-key"] = '1fea4c3efamshad5050ff344dcc5p1eea7djsn4ba1a7cb847a'
            req.headers["x-rapidapi-host"] = 'distance-calculator.p.rapidapi.com'
            req.headers["content-type"] = 'application/json'
        end

        parsed_response = JSON.parse(response.body)

        pp parsed_response
        
    end
end
