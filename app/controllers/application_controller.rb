class ApplicationController < ActionController::Base
    before_action :configure_permitted_params, if: :devise_controller?

    protected
        def configure_permitted_params
            devise_parameter_sanitizer.permit(:sign_up, keys: [:username, profile_attributes: [:location, :postcode]])
        end
end
