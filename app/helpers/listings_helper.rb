module ListingsHelper
    def render_price(sold, price)
      if !sold
       "$#{price}"
      else
        "<span class='sold-text'>Sold</span>".html_safe
      end
    end

    def render_postage(sold, postage_cost)
        if current_user && !sold
          "<div class='listing-show__postage'>
            Postage cost is <span>#{postage_cost}</span> with Australia Post Regular Parcel delivery
          </div>".html_safe
        end
    end

    
end
