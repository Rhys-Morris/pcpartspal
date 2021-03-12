class StaticPagesController < ApplicationController
  before_action :retrieve_page_data, only: %i[ home ]

  def home
  end

  private

    def retrieve_page_data
      @categories = Category.all
      @brands = Brand.all.sample(8)
      @listings = Listing.last(5)
    end
end
