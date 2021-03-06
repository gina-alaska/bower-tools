# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bower/tools/version'

Gem::Specification.new do |spec|
  spec.name          = "bower-tools"
  spec.version       = Bower::Tools::VERSION
  spec.authors       = ["Will Fisher"]
  spec.email         = ["will@teknofire.net"]
  spec.description   = %q{Tools to help integrate bower stuff in rails}
  spec.summary       = %q{Tools to help integrate bower stuff in rails}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rails", "~> 4.0.0"
  spec.add_development_dependency "rake"
end
