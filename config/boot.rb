# Defines our constants
RACK_ENV = ENV['RACK_ENV'] ||= 'development'  unless defined?(RACK_ENV)
PADRINO_ROOT = File.expand_path('../..', __FILE__) unless defined?(PADRINO_ROOT)

# Load our dependencies
require 'rubygems' unless defined?(Gem)
require 'bundler/setup'
Bundler.require(:default, RACK_ENV)

# Read database credentials from .env.environment file
require 'dotenv'
Dotenv.load ".env.development"

#log all queries
if Padrino.env == :development || ENV['QUERY_LOG']
  ActiveRecord::Base.logger = logger
end

Time.zone = 'London'
Padrino.require_dependencies "#{Padrino.root}/config/initializers/**/*.rb"

ActiveRecord::Base.time_zone_aware_attributes = true
ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])
ActiveRecord::Base.connection.schema_search_path = ENV['DATABASE_SCHEMA']
puts ActiveRecord::Base.connection.schema_search_path

Padrino.after_load do
  if ENV['SSL']
    Padrino.use Rack::SslEnforcer, :except => [%r{\/campaigns\/.+\/iframe}]
  end
end

Padrino.load!