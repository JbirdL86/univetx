# app/controllers/api/v1/users/sessions_controller.rb
module Api::V1
  class Users::SessionsController < Devise::SessionsController
    include RackSessionsFix
    # frozen_string_literal: true

    private

    # This method is a Devise callback that runs after a user is authenticated.
    def respond_with(resource, _opts = {})
      # Devise will pass `resource` (the User object) to this method.
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
          status: {message: "User could not be created successfully. #{resource.errors.full_messages.to_sentence}"}
        }, status: :unprocessable_entity
      end
    end
    
    def respond_to_on_destroy
      if current_user
        render json: {
          status: 200,
          message: "logged out successfully"
        }, status: :ok
      else
        render json: {
          status: 401,
          message: "Couldn't find an active session."
        }, status: :unauthorized
      end
    end
  end
end