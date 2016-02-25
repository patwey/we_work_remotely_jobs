# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'we_work_remotely_jobs/version'

Gem::Specification.new do |spec|
  spec.name          = "we_work_remotely_jobs"
  spec.version       = WeWorkRemotelyJobs::VERSION
  spec.authors       = ["Pat Wey"]
  spec.email         = ["patrickwey@gmail.com"]

  spec.summary       = "Parses the WeWorkRemotely programming jobs RSS feed"
  spec.homepage      = "https://rubygems.org/gems/we_work_remotely_jobs"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 1.9.2"

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_runtime_dependency "feedjira"
  spec.add_runtime_dependency "nokogiri"
end
