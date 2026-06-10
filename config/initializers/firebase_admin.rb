# config/initializers/firebase.rb
# frozen_string_literal: true

require 'firebase-admin'
require 'firebase-admin-sdk'
require 'firebase/admin/app'
require 'firebase/admin/credentials'

# Find the path to the credentials file.
credentials_file = Rails.root.join('config', 'firebase-credentials.json')

if File.exist?(credentials_file)
  # Correct way to create a credentials object from the file.
  creds = Firebase::Admin::Credentials.from_file(credentials_file)

  # Initialize the app with the correct keyword: :credentials.
  $firebase_app = Firebase::Admin::App.new(credentials: creds)
  $auth = $firebase_app.auth
  # --- DEBUGGING START ---
  # This will print the class name of the initialized Firebase app.
  puts "Firebase App class: #{$firebase_app.class.name}"

  # Log a success message.
  Rails.logger.info("Firebase Admin SDK initialized successfully.")
else
  Rails.logger.error("Firebase credentials file not found at: #{credentials_file}")
end
