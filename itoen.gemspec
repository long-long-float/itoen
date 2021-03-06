# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'itoen/version'

Gem::Specification.new do |spec|
  spec.name          = "itoen"
  spec.version       = ITOEN::VERSION
  spec.authors       = ["long-long-float"]
  spec.email         = ["niinikazuki@yahoo.co.jp"]
  spec.summary       = %q{convert numeric to English string}
  spec.description   = %q{convert numeric to English string}
  spec.homepage      = "https://github.com/long-long-float/itoen"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "andand"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
end
