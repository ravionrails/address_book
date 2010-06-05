# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ContactInfo_session',
  :secret      => '754ea2be0c08d934ca8490a6feb5b57168260dd584b10d85aa225d6941e0aa65a435557659ef847db277bc4b476427184f11551593f76d0fed55dfcce772f54a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
