# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rspec_gem/version'

Gem::Specification.new do |gem|
  gem.name          = "rspec_gem"
  gem.version       = RspecGem::VERSION
  gem.platform      = Gem::Platform::RUBY
  gem.date          = "2012-10-10"
  gem.authors       = ["michal szyma"]
  gem.email         = ["raglub.ruby@gmail.com"]
  gem.description   = %q{Invoke the tests rspec from gems in application rails.}
  gem.summary       = %q{Invoke the tests rspec from gems in application rails.}
  gem.homepage      = "https://github.com/raglub/rspec_gem"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(spec)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "rspec", ">= 2.0.0"
  gem.add_dependency "rake"
  gem.add_dependency "logger", ">= 1.2.8"
  gem.add_dependency "database_cleaner"
  gem.add_dependency "spork", ">= 0.9.2"
end
