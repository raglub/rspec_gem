# RspecGem

   Invoke the tests rspec from gems in application rails.

## Installation

Add this line to your application's Gemfile:

    gem 'rspec_gem'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rspec_gem

## Usage

For example, you have rails application of name "rails_app" and gem of name "testing_gem" with the files for testing.

### 0.2.x

You can require rails rails environment by use method (include resource of application, like models)

    RspecGem.require_rails_environment

or faster environment

    RspecGem.require_model_environment

which you add into file spec_helper.rb which is included in your gem, for example:

    require "rspec_gem"
    RspecGem.require_rails_environment

Finally in your application rails_app invoke command (all tests from directory "spec" from gem testing_gem)

    $ rspec_gem testing_gem spec

with color

    $ bundle exec rspec_gem testing_gem "spec --color"

more precisely

    $ rspec_gem testing_gem spec/testing_gem_spec.rb

### 0.1.x

Then you should include

    require "rspec_gem"
    RspecGem.new(File.expand_path("../..", __FILE__), "testing_gem")

into file ../testing_gem/lib/testing_gem.rb in your gem.

You can use path into rails environment by use method (Usage resource of application, like models)

    RspecGem.path_rails_environment

Finally in your application rails_app invoke command (all tests from directory "spec" from gem testing_gem)

    $ RAILS_ENV=test rake testing_gem:rspec spec

with color

    $ RAILS_ENV=test rake testing_gem:rspec "spec --color"

more precisely

    $ RAILS_ENV=test rake testing_gem:rspec spec/testing_gem_spec.rb
