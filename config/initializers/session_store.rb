# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_file_upload_session',
  :secret      => 'cc5aeda534cf30f3e1a6bfdd136edcac8486db326a4f361670a6d304ff534fbbb362e2d30b632078647822fddfa77c3efda8b94a4c6e2fce7df1c811c9cb307f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
