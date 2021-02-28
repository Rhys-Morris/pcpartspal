class StaticPagesController < ApplicationController
  before_action :set_categories, only: %i[ home ]
  before_action :set_brands, only: %i[ home ]
  def home
  end

  private

    def set_categories
      @categories = Category.all
    end

    def set_brands
      @brands = Brand.all.sample(8)
    end
end
