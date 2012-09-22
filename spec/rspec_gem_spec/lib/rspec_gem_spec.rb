require_relative "rspec_gem_spec/version"

require_relative "../../../lib/rspec_gem.rb"

RspecGem.new(File.expand_path("../..", __FILE__), "rspec_gem_spec")

module RspecGemSpec
end
