require 'faraday'

module ApplicationHelper

    # Return formatted string
    def listing_count(listings)
        listings = listings.select { |list| !list.sold }
        if listings.count == 1
            "1 listing for sale"
        else
            "#{listings.count} listings for sale"
        end
    end

    def format_title(title)
        if title.length > 45
            title[0..42] + "..."
        else
            title
        end
    end
end
