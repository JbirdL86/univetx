# app/controllers/api/v1/users/sessions_controller.rb
module Api::V1
  class Users::SessionsController < Devise::SessionsController
    include RackSessionsFix 
    # Keep this if you need it for session-related issues
    # frozen_string_literal: true
    #wrap_parameters false
    #Skip_before_action :require_no_authentication, only: [:create]

    respond_to :json

    #def resource_name
     # :user
    #end

     #def create
     # binding.irb
      # Explicitly permit the parameters for sign-in from the incoming request.
      #user_params = params.require(resource_name).permit(:email, :password)

      # CRUCIAL FIX: Explicitly set the permitted user_params into request.parameters.
      # This ensures Devise's strategies (like database_authenticatable) can find them
      # correctly when inspecting the raw request parameters.
      #request.parameters[resource_name] = user_params # <--- ADD THIS LINE

      # Call Devise's original create method.
      # `super` will now rely on the correctly set `request.parameters`.
     # super do |resource|
        # This block will only be entered if authentication was successful.
        # `resource` will be the authenticated user object here.
     # end
    #end



    private

    # This method is called by Devise after a successful sign-in.
    # `current_user` is provided by Devise.
    def respond_with(resource, _opts = {})
      serializer_class = resource.client? ? ClientSerializer : VetSerializer

      if resource.persisted?
        render json: {
          status: {
            code: 200,
            message: 'Logged in successfully.',
            data: { user: UserSerializer.new(resource).serializable_hash[:data][:attributes] }
          }
        }, status: :ok
      else
        render json: {
          status: {message: "User coundn't be created succesfully. #{resource.errors.full_messages.to_sentence}"}
        }, status: :unprocessable_entity
      end
    end

    # This method is called by Devise after a sign-out attempt.
    # `current_user` is available here if the token was valid before logout.
    def respond_to_on_destroy
      # Devise-JWT's `sign_out` (which `destroy` calls) handles the jti update for revocation.
      # We just need to respond with success or failure based on whether a user was logged in.
      # `current_user` is set by Devise if the token was valid
      
      if resource 
        render json: {
          status: 200,
          message: 'Logged out successfully.'
        }, status: :ok
      else
        # This block handles cases where no user was logged in, or the token was already invalid.
        # Devise's default `destroy` action would typically handle this, but if you're overriding
        # `respond_to_on_destroy`, you need to ensure the correct response.
        # For a logout, if there's no current_user, it's already "logged out" or was never logged in.
        # A 200 OK is often appropriate here, even if no user was found, as the "logout" state is achieved.
        # However, if you want to explicitly signal "no active session to log out from", 401 is fine.
        render json: {
          status: 401,
          message: "Couldn't find an active session."
        }, status: :unauthorized
      end
    end
  end
end