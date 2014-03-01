# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruakura/tapbadge/version'

Gem::Specification.new do |spec|
  spec.name          = "ruakura-tapbadge"
  spec.version       = Ruakura::Tapbadge::VERSION
  spec.authors       = ["Phil Murray"]
  spec.email         = ["pmurray@nevada.net.nz"]
  spec.description   = %q{A wee Gem to generate PDF Tapbadges}
  spec.summary       = %q{A wee Gem to generate PDF Tapbadges for the Ruakura Club}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  
  spec.add_runtime_dependency "activesupport"
  spec.add_runtime_dependency "prawn", "~>0.12.0"
  spec.add_runtime_dependency "pdf-core"
  
end
