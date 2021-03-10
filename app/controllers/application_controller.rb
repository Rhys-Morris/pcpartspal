class ApplicationController < ActionController::Base
    before_action :configure_permitted_params, if: :devise_controller?
    
    protected
        # For Devise
        def configure_permitted_params
            devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :location_id, :latitude, :longitude])
        end
end
