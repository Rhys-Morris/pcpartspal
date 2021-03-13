class StaticPagesController < ApplicationController
  before_action :retrieve_page_data, only: %i[ home ]

  def home
  end

  private

    # Get data required for render
    def retrieve_page_data
      @categories = Category.all
      @brands = Brand.sample(8)
      @listings = Listing.last_five
    end
end
