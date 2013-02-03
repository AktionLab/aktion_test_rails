# AktionTestRails

[![Code Climate](https://codeclimate.com/github/AktionLab/aktion_test_rails.png)](https://codeclimate.com/github/AktionLab/aktion_test_rails)
[![Build Status](https://secure.travis-ci.org/AktionLab/aktion_test_rails.png?branch=master)](https://travis-ci.org/AktionLab/aktion_test_rails)
[![Dependency Status](https://gemnasium.com/AktionLab/aktion_test_rails.png)](https://gemnasium.com/AktionLab/aktion_test_rails)

Testing gem that includes a common set of testing gems, along with a suite of rspec matchers

## Installation

Add this line to your application's Gemfile:

    gem 'aktion_test_rails'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install aktion_test_rails

## Usage

By default requiring aktion_test_rails will only setup some constants for lazy loading.

    require 'aktion_test_rails/load'

Adding that line to your testing bootstrap (ie spec/test helper) will load up the full
testing environment. Most everything else can be lazy loaded on a per spec basis using
includes.

    describe SomeClass do
      include AktionTestRails::Support:Rails::ModelBuilder
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
