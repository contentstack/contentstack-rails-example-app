require 'contentstack'
require 'yaml'

if File.exists?("#{Rails.root}/config/contentstack.yml")
  config = YAML.load_file("#{Rails.root}/config/contentstack.yml")[Rails.env]
  $STACK = Contentstack::Client.new(config["api_key"], config["access_token"], "production")
end