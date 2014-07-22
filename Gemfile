source 'https://rubygems.org'

gem 'rails', '4.1.1'

gem 'pg'
gem 'sass-rails', '~> 4.0.3'
gem 'bootstrap-sass', '~> 3.2.0'
gem 'bootstrap_form'
gem 'font-awesome-sass'
gem 'autoprefixer-rails'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

gem 'devise', '~> 3.2.4'
gem 'omniauth', '~> 1.2.2'
gem 'omniauth-twitter', '~> 1.0.1'

# gem 'validates_phone_number', '~> 2.0.1' # Wrote my own regex

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

group :development do
  gem 'better_errors'
end

group :development, :test do
  # gem 'rspec-rails', '~> 3.0.0'
  gem 'rspec-rails', '~> 2.99.0'
  gem 'factory_girl_rails', '~> 4.4.1'
  gem 'jazz_hands', github: 'nixme/jazz_hands', branch: 'bring-your-own-debugger'
  gem 'pry-byebug'
  gem 'database_cleaner', '~> 1.3.0'
end

group :test do
  gem 'capybara', '~> 2.3.0'
  gem 'faker', '~> 1.4.2'
end
