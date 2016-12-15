# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hold_firefox/version'

Gem::Specification.new do |spec|
  spec.name          = "hold_firefox"
  spec.version       = HoldFirefox::VERSION
  spec.authors       = ["Danilo Jeremias da Silva"]
  spec.email         = ["dannnylo@gmail.com"]

  spec.summary       = %q{Hold firefox on version 45.}
  spec.description   = %q{Hold firefox on version 45 to work with cucumber without marionette.}
  spec.homepage      = "https://rubygems.org/gems/hold_firefox"
  spec.license       = "MIT"
  spec.extensions    = %w[ext/hold_firefox/extconf.rb]

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end

