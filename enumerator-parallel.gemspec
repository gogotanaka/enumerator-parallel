# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'enumerator-parallel/version'

Gem::Specification.new do |spec|
  spec.name          = "enumerator-parallel"
  spec.version       = ParallelEnumerable::VERSION
  spec.authors       = ["gogotanaka"]
  spec.email         = ["mail@tanakakazuki.com"]

  spec.summary       = %q{ Simple wrapper between enumerator and parallel. }
  spec.description   = %q{ Simple wrapper between enumerator and parallel. }
  spec.homepage      = "https://github.com/gogotanaka/enumerator-parallel"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'parallel', ['>=1.4.1']

  spec.add_development_dependency 'bundler', ['>= 1.0.0']
  spec.add_development_dependency 'rake', ['>= 0']
  spec.add_development_dependency "minitest"
end
