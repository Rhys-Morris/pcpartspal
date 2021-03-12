class ListingsController < ApplicationController
  before_action :set_listing, only: %i[ show edit update destroy postage ]
  before_action :authenticate_user!, except: %i[ index show filter postage ]
  before_action :confirm_listing_owner, only: %i[ edit destroy ]
  before_action :set_form_parameters, only: %i[ new edit index filter ]
  before_action :get_postage_options, only: %i[ show postage ]
  before_action :create_stripe_session, only: %i[ postage ]

  # GET /listings
  def index
    @listings = Listing.all
  end

  def filter
    filtered_hash = filter_params.reject {|k, v| v.blank?}.to_h
    @listings = Listing.filter(filtered_hash)
    render "index"
  end

  # Render postage costs to view and update Stripe session
  def postage
    @postage_cost = params[:postage_option] unless params[:postage_option].blank?
    render "show"
  end

  # GET /listings/1
  def show
  end

  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit
    # Convert price from cents to dollars on form render
    @listing.price = @listing.price / 100
  end

  # POST /listings
  def create
    @listing = current_user.listings.new(listing_params)
      
    if @listing.save
      flash[:success] = "Listing successfully created"
      redirect_to @listing
    else
      set_form_parameters
      render "new"
    end
  end

  # PATCH/PUT /listings/1
  def update
      if @listing.update(listing_params)
        flash[:success] = "Listing successfully updated"
        redirect_to @listing
      else
        set_form_parameters
        render "edit"
      end
  end

  # DELETE /listings/1 or /listings/1.json
  def destroy
    @listing.destroy
    flash[:success] = "Listing successfully destroyed"
    redirect_to listings_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    def filter_params 
      params.require(:filtered).permit(:commit, :category_id, :brand_id)
    end 

    # Only allow a list of trusted parameters through.
    def listing_params 
      params.require(:listing).permit(:title, :description, :price, :condition, :length, :width, :height, :weight, :category_id, :brand_id, images: [])
    end 

    def set_form_parameters
      @categories = Category.all.sort_by { |cat| cat.name }
      @brands = Brand.all.sort_by { |brand| brand.name }
      @conditions = Listing.conditions.keys
    end

    def confirm_listing_owner
      if current_user.id != @listing.user.id
        flash[:alert] = "Unable to authorise, cannot edit a listing that is not your own."
        redirect_to @listing
      end
    end

    # Create stripe session if user signed in
    def create_stripe_session
      return if !user_signed_in?
      session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        customer_email: current_user.email || nil,
        line_items: [{
          name: @listing.title,
          description: @listing.description.blank? ? nil : @listing.description,
          images: @listing.images.attached? ? [@listing.images[0].service_url] : nil,
          amount: @listing.price.to_i + params[:postage_option].to_i,
          currency: 'aud',
          quantity: 1,
        }],
        payment_intent_data: {
          metadata: {
            listing_id: @listing.id,
            purchaser_id: current_user.id
          }
        },
        success_url: "#{root_url}/payments/success?listingId=#{@listing.id}",
        cancel_url: "#{root_url}/listings"
      )
      @session_id = session.id
    end

    # Calculate listing postage for current user if signed in
    def get_postage_options
      return nil if !user_signed_in?
      # API key
      api_key = "c48a22bb-0ffa-4a4e-aa55-586af1e58b92"
      # Set up query params
      query_params = {
          "from_postcode" => @listing.user.location.postcode,
          "to_postcode" => current_user.location.postcode,
          "length" => @listing.length,
          "width" => @listing.width,
          "height" => @listing.height,
          "weight" => @listing.weight,
      }

      url = "https://digitalapi.auspost.com.au/postage/parcel/domestic/service.json?"
  
      response = Faraday.get(url + query_params.to_query) do |req|
          req.headers["AUTH-KEY"] = api_key
      end
      parsed_response = JSON.parse(response.body)
      
      # puts "---------"
      # pp parsed_response

      # Extract postage options from response
      @postage_options = []
      parsed_response["services"]["service"].each do |option|
        @postage_options.push({code: option["code"], name: convert_postage_name(option["code"]), price: option["price"]})
      end

      @postage_options
    end
end
