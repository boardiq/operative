# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'operative/version'

Gem::Specification.new do |spec|
  spec.name          = "operative"
  spec.version       = Operative::VERSION
  spec.authors       = ["JGW Maxwell"]
  spec.email         = ["tech@boardintelligence.co.uk"]
  spec.summary       = %q{Operative is an out-of-bound processor for tasks.}
  spec.description   = %q{Operative is an out-of-bound processor for tasks.}
  spec.homepage      = "http://www.boardintelligence.co.uk"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
