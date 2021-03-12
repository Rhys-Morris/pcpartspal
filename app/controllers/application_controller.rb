class ApplicationController < ActionController::Base
    before_action :configure_permitted_params, if: :devise_controller?
    
    def convert_postage_name(name)
        name = name.split("_").each { |option| option.capitalize! }
        name.join(" ")
    end

    protected
        # For Devise
        def configure_permitted_params
            devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :location_id, :latitude, :longitude])
        end
end
