# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'logvisual/version'

Gem::Specification.new do |spec|
  spec.name          = 'logvisual'
  spec.version       = Logvisual::VERSION
  spec.authors       = ['angelbotto']
  spec.email         = ['angelbotto@gmail.com']

  spec.summary       = 'Track anything :)'
  spec.description   = 'Track anything using hashtags to categorize.'
  spec.homepage      = 'http://logvisual.co'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.bindir        = 'bin'
  spec.executables   = ['lv']
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.0.0'
  spec.add_runtime_dependency 'commander', '~> 4.0'
  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
end
