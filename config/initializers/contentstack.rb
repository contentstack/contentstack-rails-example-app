require 'contentstack'
require 'yaml'

if File.exist?("#{Rails.root}/config/contentstack.yml")
  # Load YAML with alias support explicitly enabled
  config = YAML.safe_load(File.read("#{Rails.root}/config/contentstack.yml"), aliases: true)[Rails.env]
  $STACK = Contentstack::Client.new(config["api_key"], config["access_token"], config["environment"])
end
