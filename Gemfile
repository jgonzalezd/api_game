source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.1.1'
gem 'puma', '~> 3.7'
gem 'active_model_serializers', '~> 0.10.6'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

gem 'pg'
# gem 'sqlite3'
# gem 'pg_search'
# gem 'dotenv'

gem 'faker', '>= 1.6.1', group: [:development, :test]

group :development, :test do
  gem 'byebug', platforms: :mri
end

group :development do
  gem 'activerecord-import'
  gem 'annotate'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'guard-rspec' #The Guard file watcher for running rspec
  gem 'factory_girl_rails', group: [:development, :test, :staging]
  gem 'database_cleaner'
  gem 'rspec-rails' #The RSpec testing framework with Rails integrations
  gem 'rspec-json_expectations'
end
