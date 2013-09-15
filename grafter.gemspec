# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'grafter/version'

Gem::Specification.new do |spec|
  spec.name          = "grafter"
  spec.version       = Grafter::VERSION
  spec.authors       = ["OSA Shunsuke"]
  spec.email         = ["hhelibebcnofnenamg@gmail.com"]
  spec.description   = %q{This gem bundles layered instances to tree structured instances.}
  spec.summary       = %q{Bundle layered instances to tree structured instances}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
