source 'https://rubygems.org'

gem 'rails', '~> 3.2.9'
gem 'activeadmin', '~> 0.5.0'
gem 'jquery-rails'

group :assets do
  gem 'coffee-rails', '~> 3.2.1'
  gem 'sass-rails', '~> 3.2.3'
end

platforms :ruby do
  gem 'sqlite3'
end

platforms :jruby do
  gem 'activerecord-jdbc-adapter'
  gem 'activerecord-jdbcsqlite3-adapter'
  gem 'jdbc-sqlite3'
end

gemspec
