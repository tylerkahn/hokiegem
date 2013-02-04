# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hokiespa/version'

Gem::Specification.new do |gem|
  gem.name          = "hokiespa"
  gem.version       = HokieSpa::VERSION
  gem.authors       = ["Tyler Kahn"]
  gem.email         = ["tkahn6@gmail.com"]
  gem.description   = %q{wrapper for hokiespa library}
  gem.summary       = %q{wrapper for hokiespa library}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib", "hokiespa/__init__.py", "hokiespa/hokiespa.py"]

  gem.add_dependency('msgpack', ">= 0.5.1")
end
