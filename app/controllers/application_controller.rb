class ApplicationController < ActionController::API
    before_action :configure_permitted_paremeters, if: :devise_controller?
    devise_group :user, contains: [:vet, :client]

    def configure_permitted_paremeters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :type])
    end
end
