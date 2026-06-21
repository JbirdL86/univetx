# app/services/firebase_admin_service.rb

# frozen_string_literal: true

module FirebaseAdminService
  class << self
    def app
      # We'll use a memoization pattern to ensure the app is only initialized once
      # and is available throughout the application.
      @app ||= initialize_app
    end

    def auth
      app.auth
    end

    private

    def initialize_app
      credentials_file = Rails.root.join('config', 'firebase-credentials.json')

      unless File.exist?(credentials_file)
        Rails.logger.error("Firebase: Credentials file not found at #{credentials_file}. Initialization failed.")
        return nil # Return nil if the file is not found
      end

      begin
        creds = FirebaseAdmin::SDK::Credentials.from_file(credentials_file)
        project_id = creds.project_id
        Rails.logger.info("Firebase: Initializing app for project: #{project_id}")
        
        FirebaseAdmin::SDK::App.new(project_id: project_id, credential: creds)
      rescue StandardError => e
        Rails.logger.error("Firebase: Initialization error: #{e.message}")
        nil # Return nil on error
      end
    end
  end
end
