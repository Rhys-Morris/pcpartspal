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
end
