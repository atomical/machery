# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'machery/version'

Gem::Specification.new do |spec|
  spec.name          = 'machery'
  spec.version       = Machery::VERSION
  spec.authors       = ['Adam Hallett']
  spec.email         = ['adam.t.hallett@gmail.com']
  spec.summary       = %q{A wrapper for using Mach OSX functions in Ruby.}
  spec.description   = %q{A wrapper for using Mach OSX functions in Ruby.}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'sys-proctable'
  spec.add_development_dependency 'debugger'
  spec.add_development_dependency 'rspec'

  spec.add_dependency 'ffi'
  spec.add_dependency 'ffi-inliner', '>= 0.2.4'
end
