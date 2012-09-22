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
  end

end
