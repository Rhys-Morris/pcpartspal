class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: %i[ webhook ]
  before_action :authenticate_user!, only: [:success]

  def success
    puts params[:listingId]
    listing_id = params[:listingId]
    @purchase = Purchase.find_by_listing_id(listing_id.to_i)
    @listing = Listing.find(listing_id.to_i)
  end

  def webhook
    puts "-------------"
    pp params
    payment_id = params[:data][:object][:payment_intent]
    payment = Stripe::PaymentIntent.retrieve(payment_id)
    payment_id = payment.id
    receipt_url = payment.charges.data[0].receipt_url
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
    new_purchase = Purchase.new("user_id": purchaser_id, "listing_id": listing_id, "payment_intent": payment_id, "receipt_url": receipt_url)

    if new_purchase.save
      render plain: "Success"
    else
      puts "----- Error saving new purchase ----- "
      flash[:alert] = "Error saving purchase"
      redirect_to listing_path
    end
  end
end
