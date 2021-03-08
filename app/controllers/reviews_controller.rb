class ReviewsController < ApplicationController
  before_action :set_review, only: %i[ edit update ]
  before_action :set_listing, only: %i[ new create ]
  before_action :authenticate_user!

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    pp @listing

    if @review.save
      flash[:success] = "Review successfully left"
      @listing.reviewed = true
      @listing.save
      redirect_to profile_path(current_user.profile.id)
    else
      flash[:alert] = "Error leaving review"
      set_listing
      render "new"
    end
  end

  def edit
    @listing = @review.listing
  end

  def update
    if @review.update(review_params)
      flash[:success] = "Review successfully updated"
      redirect_to profile_path(current_user.profile.id)
    else
      flash[:alert] = "Error updating review"
      @listing = @review.listing
      render "edit"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    def set_listing
      if params[:listing_id]
        # Get correct listing from profile link
        @listing =  Listing.find(params[:listing_id])
      else
        # Get correct listing inside create action
        @listing =  Listing.find(params[:review][:listing_id])
      end
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:rating, :message, :user_id, :listing_id)
    end
end
