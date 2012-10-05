# encoding: utf-8
require_relative "rspec_gem/version"

class RspecGem

  # create task for your gem
  # path - path into directory of your gem
  # name_of_gem - name of your gem
  def initialize(path, name_of_gem)
    @@path = path
    @@name_of_gem = name_of_gem
    load File.expand_path("../tasks/rspec_gem.rake", __FILE__) if defined?(Rake)
  end

  class << self
    def name_of_gem
      @@name_of_gem
    end

    def path
      @@path
    end

    def path_rails_environment
      return File.expand_path("config/environment", Rails.root) if defined?(Rails)
      File.expand_path("config/environment", ENV["PWD"])
    end

    # require full rails environment
    def require_rails_environment
      require File.expand_path("config/environment", ENV["PWD"])
    end

    # require simply environment without active records
    def require_unit_environment
      require "active_support"
      require "active_support/dependencies"
      %w{ extensions helpers mailers models presenters }.each do |dir|
        ActiveSupport::Dependencies.autoload_paths <<
          File.expand_path("app/#{dir}", ENV["PWD"])
      end
    end

    # require active record with database
    def require_model_environment
      require_unit_environment
      ENV["RAILS_ENV"] ||= "test"

      # ActiveRecord
      require "yaml"
      require "active_record"
      ActiveRecord::Base.establish_connection(
        YAML.load(File.read(ENV["PWD"] + "/config/database.yml"))["test"]
      )

      # DatabaseCleaner
      require "database_cleaner"
      RSpec.configure do |config|
        config.before(:suite) do
          DatabaseCleaner.strategy = :transaction
          DatabaseCleaner.clean_with(:truncation)
        end
        config.before(:each) do
          DatabaseCleaner.start
        end
        config.after(:each) do
          DatabaseCleaner.clean
        end
      end

      # configurations into database
      ActiveRecord::Base.send(:configurations=, YAML::load(ERB.new(IO.read(ENV["PWD"] + "/config/database.yml")).result))
    end

  end

end
