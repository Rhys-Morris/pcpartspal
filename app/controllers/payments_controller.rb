class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: %i[ webhook ]

  def success
  end

  def webhook
    payment_id = params[:data][:object][:payment_intent]
    payment = Stripe::PaymentIntent.retrieve(payment_id)
    purchaser_id = payment.metadata.purchaser_id
    listing_id = payment.metadata.listing_id
    purchased_listing = Listing.find(listing_id)
    purchased_listing["sold"] = true
    
    if purchased_listing.save
      flash[:success] = "Payment sold switched to true"
    end
    render plain: "Success"
  end
end
