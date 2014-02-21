# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simple_deploy_ssh'

Gem::Specification.new do |spec|
  spec.name          = "simple_deploy_ssh"
  spec.version       = SimpleDeploySSH::VERSION
  spec.authors       = ["Bradly Feeley"]
  spec.email         = ["bradlyf@gmail.com"]
  spec.summary       = %q{A gem to make it easier to ssh to instances managed with simple_deploy}
  spec.description   = %q{A gem to make it easier to ssh to instances managed with simple_deploy}
  spec.homepage      = "https://github.com/bradly/simple_deploy_ssh"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency('simple_deploy')

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
