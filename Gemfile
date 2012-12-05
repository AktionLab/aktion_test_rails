source 'https://rubygems.org'

# Specify your gem's dependencies in aktion_test_rails.gemspec
gemspec

gem 'rails', '~> 3.2.9'
gem 'activeadmin', '~> 0.5.0'
gem 'coffee-rails', '~> 3.2.1'
gem 'sass-rails', '~> 3.2.3'
gem 'jquery-rails'

# JS interpreter
# Database

platforms :ruby do
  gem 'sqlite3'
end

platforms :jruby do
  gem 'activerecord-jdbc-adapter'
  gem 'jdbc-sqlite3'
end
