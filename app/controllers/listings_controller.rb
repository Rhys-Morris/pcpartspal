class ListingsController < ApplicationController
  before_action :set_listing, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: %i[ index show ]
  before_action :set_form_parameters, only: %i[ new edit]
  before_action :create_stripe_session, only: %i[ show ]

  # GET /listings or /listings.json
  def index
    @listings = Listing.all
  end

  # GET /listings/1 or /listings/1.json
  def show
  end

  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings or /listings.json
  def create
    user_id = current_user.id
    @listing = Listing.new(listing_params)
    @listing["user_id"] = user_id
      
    if @listing.save
      flash[:success] = "Listing successfully created."
      redirect_to @listing
    else
      set_form_parameters
      render "new"
    end
  end

  # PATCH/PUT /listings/1 or /listings/1.json
  def update
      if @listing.update(listing_params)
        flash[:success] = "Listing successfully updated."
        redirect_to @listing
      else
        set_form_parameters
        render "edit"
      end
  end

  # DELETE /listings/1 or /listings/1.json
  def destroy
    @listing.destroy
    flash[:success] = "Listing was successfully destroyed."
    redirect_to listings_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def listing_params
      params.require(:listing).permit(:title, :description, :price, :sold, :condition, :category_id, :brand_id, images: [])
    end

    def set_form_parameters
      @categories = Category.all.sort_by { |cat| cat.name }
      @brands = Brand.all.sort_by { |brand| brand.name }
      @conditions = Listing.conditions.keys
    end

    def create_stripe_session
      return if !user_signed_in?
      session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        customer_email: current_user.email,
        line_items: [{
          name: @listing.title,
          description: @listing.description,
          images: [@listing.images[0].service_url],
          amount: @listing.price.to_i * 100,
          currency: 'aud',
          quantity: 1,
        }],
        payment_intent_data: {
          metadata: {
            listing_id: @listing.id,
            purchaser_id: current_user.id
          }
        },
        success_url: "#{root_url}/payments/success?listingId={@listing.id},
        cancel_url: "#{root_url}/listings"
      )
      @session_id = session.id
    end
end
