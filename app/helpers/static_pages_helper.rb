module StaticPagesHelper
    def format_background_image(object_name, file_extension)
        "#{object_name.downcase.gsub(/ /, "-")}.#{file_extension}"
    end
end
