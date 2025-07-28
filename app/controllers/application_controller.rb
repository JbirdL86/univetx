class ApplicationController < ActionController::API
    before_action :configure_permitted_parameters, if: :devise_controller?
    devise_group :user, contains: [:vet, :client]

    protected 
    
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:type, :name, :last_name, :speciality, :address, :country, :city])
    end
end
