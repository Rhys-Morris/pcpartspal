class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: %i[ webhook ]
  before_action :authenticate_user!, only: [:success]


  def success
    listing_id = params[:listingId].to_i

    # Pass purchase information to view
    @purchase = Purchase.find_by_listing_id(listing_id)
  end

  def webhook
    
    payment_id = params[:data][:object][:payment_intent]
    payment = Stripe::PaymentIntent.retrieve(payment_id)

    # Get information to store as Purchase
    payment_id = payment.id
    receipt_url = payment.charges.data[0].receipt_url
    purchaser_id = payment.metadata.purchaser_id
    listing_id = payment.metadata.listing_id

    # Switch listing to sold
    purchased_listing = Listing.find(listing_id)
    purchased_listing["sold"] = true

    # Catch errors
    if purchased_listing.save
      puts "----- Listing set to sold successfully  ----- "
    else
      puts "----- Error setting listing to sold -----"
    end

    # Add new Purchase and find purchaser
    @new_purchase = Purchase.new("user_id": purchaser_id, "listing_id": listing_id, "payment_intent": payment_id, "receipt_url": receipt_url)
    @user = User.find(purchaser_id)

    if @new_purchase.save
      # Send confirmation of purchase to user email
      UserMailer.with(purchase: @new_purchase, user: @user).purchase_confirmation.deliver_now
      render plain: "Success"
    else
      puts "----- Error saving new purchase ----- "
      flash[:alert] = "Error saving purchase"
      redirect_to listing_path
    end
  end
end
