# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'homework3/version'

Gem::Specification.new do |spec|
  spec.name          = 'homework3'
  spec.version       = Homework3::VERSION
  spec.authors       = ['Volodymyr Byno']
  spec.email         = ['volodymyr.byno@gmail.com']
  spec.summary       = 'Metaprogramming Homework'
  spec.description   = 'A couple of simple tasks'
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'fuubar'
  spec.add_development_dependency 'pry'
end
