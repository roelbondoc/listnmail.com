# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_distrolist_session',
  :secret      => '3833a25fab1810b4a1ff77b41451715a357785e29994903ed1a0e1be5cf09bb45c370ebe654701c46a81e1048bde89b7bf0fc686a8a01414538dff157db8c093'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
