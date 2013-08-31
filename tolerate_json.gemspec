# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tolerate_json/version'

Gem::Specification.new do |spec|
  spec.name          = "tolerate_json"
  spec.version       = TolerateJson::VERSION
  spec.authors       = ["Matthew Nielsen"]
  spec.email         = ["xunker@pyxidis.org"]
  spec.description   = %q{A JSON formatter written in pure Ruby that works "good enough" and has no gem dependencies. 60% of the time, it works every time.}
  spec.summary       = %q{Tolerate_json is a pure-ruby Json formatter that has no outside gem dependencies. It almost works right and is good enough so you can tolerate reading JSON from your screen (hence the name). It is designed to be a simple formatter for when you need a lightweight component, but it is not suitable for cases where proper formatting is mission-critical. Compatible with MRI 1.8.7, 1.9.3 and 2.0.0 as well as JRuby and Rubinius in those modes.}
  spec.homepage      = "https://github.com/xunker/tolerate_json"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", ">= 2.10"
end
