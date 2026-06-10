# app/controllers/api/v1/firebase_sessions_controller.rb
module Api
  module V1
    class FirebaseSessionsController < ApplicationController
      # CSRF protection is not needed for a stateless API endpoint.
      skip_before_action :verify_authenticity_token

      # A dedicated action for handling Firebase login.
      def create
        # Find the user by email. We are not using Devise's `warden` here.
        user = User.find_by(email: params[:user][:email])

        # Check if the user exists and the password is correct.
        if user && user.valid_password?(params[:user][:password])
          uid = user.id.to_s
          user_type = user.type

          begin
            # Generate the Firebase custom token. This logic remains the same.
            firebase_custom_token = generate_firebase_custom_token(uid, user_type)

            # Use the correct serializer based on the user type.
            serializer_class = user.client? ? ClientSerializer : VetSerializer
            user_data = serializer_class.new(user).serializable_hash[:data][:attributes]

            # Render a successful JSON response with the custom token.
            render json: {
              status: {
                code: 200,
                message: 'Logged in successfully.',
                data: {
                  user: user_data,
                  custom_token: firebase_custom_token
                }
              }
            }, status: :ok
          rescue StandardError => e
            Rails.logger.error("Firebase Custom Token Error: #{e.message}")
            render json: {
              status: {
                message: "Failed to create custom token. Error: #{e.message}"
              }
            }, status: :internal_server_error
          end
        else
          # Handle failed authentication.
          render json: {
            status: { message: "Invalid email or password." }
          }, status: :unauthorized
        end
      end

      private

      # The token generation logic is kept in a private method for cleanliness.
      def generate_firebase_custom_token(uid, user_type)
        require 'jwt'
        require 'openssl'
        require 'json'

        credentials_path = Rails.root.join('config', 'firebase-credentials.json')
        unless File.exist?(credentials_path)
          raise "Firebase credentials file not found at: #{credentials_path}"
        end

        firebase_credentials_json = JSON.parse(File.read(credentials_path), symbolize_names: true)

        private_key = OpenSSL::PKey::RSA.new(firebase_credentials_json[:private_key])
        client_email = firebase_credentials_json[:client_email]

        now = Time.now.to_i
        payload = {
          'iss' => client_email,
          'sub' => client_email,
          'aud' => 'https://identitytoolkit.googleapis.com/google.identity.identitytoolkit.v1.IdentityToolkit',
          'iat' => now,
          'exp' => now + (60 * 60), # Token expires in 1 hour
          'uid' => uid,
          'claims' => {
            'userType' => user_type
          }
        }

        JWT.encode(payload, private_key, 'RS256')
      end
    end
  end
end
