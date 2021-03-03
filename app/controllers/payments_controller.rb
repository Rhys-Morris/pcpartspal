class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: %i[ webhook ]

  def success
  end

  def webhook
    pp params["data"]
    payment_id = params[:data][:object][:payment_intent]
    payment = Stripe::PaymentIntent.retrieve(payment_id)
    pp payment
    payment_id = payment.id
    receipt_url = payment.charges.receipt_url
    purchaser_id = payment.metadata.purchaser_id
    listing_id = payment.metadata.listing_id

    # Switch listing to sold status
    purchased_listing = Listing.find(listing_id)
    purchased_listing["sold"] = true

    if purchased_listing.save
      puts "----- Listing status sold switched to true ----- "
    else
      puts "----- Error in webhook -----"
    end

    # Add purchase entity
  end
end
