# Load the Rails application.
require File.expand_path('../application', __FILE__)
require 'pdf/writer'

# Initialize the Rails application.
Rails.application.initialize!
Mime::Type.register 'application/pdf', :pdf