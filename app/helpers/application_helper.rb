require 'faraday'

module ApplicationHelper
    def user_listing_count(user)
        count = Listing.where("user_id": user.id).count
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

    def aus_post(from_postcode, to_postcode)
        # API key
        api_key = "c48a22bb-0ffa-4a4e-aa55-586af1e58b92"

        # Package set up
        service_code = "AUS_PARCEL_REGULAR"
        parcel_length = 50
        parcel_width = 30
        parcel_height = 10
        parcel_weight = 1.5

        # Set up query params
        query_params = {
            "from_postcode" => from_postcode,
            "to_postcode" => to_postcode,
            "length" => parcel_length,
            "width" => parcel_width,
            "height" => parcel_height,
            "weight" => parcel_weight,
            "service_code" => service_code    
        }

        url = "https://digitalapi.auspost.com.au/postage/parcel/domestic/calculate.json?"
    
        response = Faraday.get(url + query_params.to_query) do |req|
            req.headers["AUTH-KEY"] = api_key
        end

        # Response debugging
        # puts "------------"
        # pp response

        parsed_response = JSON.parse(response.body)
        total_cost = parsed_response["postage_result"]["total_cost"]

        "Estimated postage cost is $#{total_cost} with Australia Post Regular Parcel delivery"
    end
end
