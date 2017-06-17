# Load the Rails application.
require_relative 'application'

SCORES = YAML.load_file('config/scores.yml')
# Initialize the Rails application.
Rails.application.initialize!
