# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_theiropinion_session',
  :secret      => 'aaccb6f24e424fbcef62a312ee92ad9d70c694cfa3e79b3e73387039152f1b337e1e63ff87a7e011bfe4ecc4623b38e8f913ef9c902f97179b12e6061b104818'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
