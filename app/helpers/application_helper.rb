module ApplicationHelper
    def user_listing_count(user)
        count = Listing.where("user_id": user.id).count
        if count == 1
            "#{count} listing for sale"
        else
            "#{count} listings for sale"
        end
    end
end
