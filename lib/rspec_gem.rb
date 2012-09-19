# encoding: utf-8
require "rspec_gem/version"

module RspecGem

  class << self

    def config(path, name)
      @path = path
      @name_of_gem = name
    end

    def path
      File.expand_path("../../", @path)
    end

    def name_of_gem
      @name_of_gem
    end

    def require_rails_environment
      require File.expand_path("../config/environment", Rails.root) if defined?(Rails)
    end

  end

  config(__FILE__, "rspec_gem")

  load File.expand_path("../tasks/rspec_gem.rake", __FILE__) if defined?(Rake)

end
