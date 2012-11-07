# encoding: utf-8

require_relative "rspec_gem/version"

class RspecGem

  class << self
    def app_path
      ENV["PWD"]
    end

    def path_rails_environment
      File.expand_path("config/environment", app_path)
    end

    # require full rails environment
    def require_rails_environment
      require path_rails_environment
    end

    # require simply environment without active records
    def require_unit_environment
      require "active_support"
      require "active_support/dependencies"
      %w{ extensions helpers mailers models presenters }.each do |dir|
        ActiveSupport::Dependencies.autoload_paths <<
          File.expand_path("app/#{dir}", app_path)
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
        YAML.load(File.read(app_path + "/config/database.yml"))["test"]
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
      ActiveRecord::Base.send(:configurations=, YAML::load(ERB.new(IO.read(app_path + "/config/database.yml")).result))
    end

  end

end
