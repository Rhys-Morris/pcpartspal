class WatchesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_watch, only: %i[ destroy ]
    before_action :watch_params, only: %i[ create ]


    def index
        redirect_to profile_path(current_user.profile.id, display: "watchlist")
    end

    def create

        @watch = Watch.new(watch_params)

        if @watch.save
            flash[:success] = "Added #{@watch.listing.title} to watchlist"
            redirect_to listing_path(@watch.listing_id)
        else
            flash[:alert] = "Unable to add to watchlist"
            redirect_to listing_path(@watch.listing_id)
        end
    end

    def destroy
        @watch.destroy
        flash[:notice] = "Removed from watchlist"
        redirect_to listing_path(@watch.listing_id)
    end

    private

    def set_watch
        @watch = Watch.find(params[:id])
      end

    def watch_params
        params.require(:watch).permit(:listing_id, :profile_id)
    end


end
