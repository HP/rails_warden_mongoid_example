# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_rails_warden_mongoid_example_session',
  :secret      => '45aa6b1596733c51a76d558459497726d727e13c71cb8e4bdc5b350d385182d0a249f96b9b7243b5829e9a472bf59bded7e802887bc54263c34e7962857ee800'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
