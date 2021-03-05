module StaticPagesHelper
    def format_background_image(category_name)
        "#{category_name.downcase.gsub(/ /, "-")}.jpg"
    end
end
