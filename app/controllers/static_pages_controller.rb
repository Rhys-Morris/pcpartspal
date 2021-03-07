class StaticPagesController < ApplicationController
  before_action :set_categories_and_brands, only: %i[ home ]

  def home
  end

  private

    def set_categories_and_brands
      @categories = Category.all
      @brands = Brand.all.sample(8)
    end
end
