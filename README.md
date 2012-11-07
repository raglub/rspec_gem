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

For example, you have rails application of name "rails_app" and gem of name "example_gem" with the files for testing.

You can require rails rails environment by use method (include resource of application, like models)

    RspecGem.require_rails_environment

or faster environment

    RspecGem.require_model_environment

which you add into file spec_helper.rb which is included in your gem, for example:

    require "rspec_gem"
    RspecGem.require_rails_environment

Finally in your application rails_app invoke command (all tests from directory "spec" from gem example_gem)

    $ bundle exec rspec_gem example_gem spec

with color

    $ bundle exec rspec_gem example_gem spec --color

more precisely

    $ rspec_gem example_gem spec/example_gem_spec.rb

show all tracks to testing files

    $ rspec_gem example_gem -t

testing using spork

    $ rspec_gem example_gem spec/models/. --drb
