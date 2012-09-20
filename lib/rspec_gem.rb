# encoding: utf-8
require_relative "rspec_gem/version"

class RspecGem

  def initialize(path, name)
    @@path = path
    @@name_of_gem = name
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
      File.expand_path("config/environment", ENV["PWD"])
    end
  end

end
