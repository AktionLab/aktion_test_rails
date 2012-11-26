# -*- encoding: utf-8 -*-
require File.expand_path('../lib/aktion_test_rails/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Chris Boertien"]
  gem.email         = ["chris@aktionlab.com"]
  gem.description   = %q{Subproject of aktion_test, adding rails versions of gems, libraries and rake tasks.}
  gem.summary       = %{Rails testing setup}
  gem.homepage      = "http://aktionlab.com"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "aktion_test_rails"
  gem.require_paths = ["lib"]
  gem.version       = AktionTestRails::VERSION

  gem.add_dependency 'aktion_test', '~> 0.0.2'
  gem.add_dependency 'rspec-rails', '~> 2.12.0'
  gem.add_dependency 'factory_girl_rails', '~> 4.1.0'
  gem.add_dependency 'database_cleaner', '~> 0.9.1'
  gem.add_dependency 'capybara', '~> 1.1.3'
  gem.add_dependency 'poltergeist', '~> 1.0.2'
  gem.add_dependency 'launchy', '~> 2.1.2'
  gem.add_dependency 'shoulda-matchers', '~> 1.4.1'

  gem.add_development_dependency 'appraisal', '~> 0.5.1'
end
