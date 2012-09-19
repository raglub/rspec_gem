# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rspec_gem/version'

Gem::Specification.new do |gem|
  gem.name          = "rspec_gem"
  gem.version       = RspecGem::VERSION
  gem.platform      = Gem::Platform::RUBY
  gem.date          = "2012-09-19"
  gem.authors       = ["michal szyma"]
  gem.email         = ["raglub.ruby@gmail.com"]
  gem.description   = %q{Invoke the tests rspec from gems in application rails.}
  gem.summary       = %q{Invoke the tests rspec from gems in application rails.}
  gem.homepage      = "https://github.com/raglub/rspec_gem"

  gem.files         = `git ls-files`.split($/)
  gem.test_files    = gem.files.grep(%r{^(spec)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rspec"
  gem.add_dependency "logger", ">= 1.2.8"
  gem.add_dependency "rake"
end
