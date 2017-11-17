# -*- encoding: utf-8 -*-

require File.expand_path('../lib/tagenv/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "tagenv"
  gem.version       = Tagenv::VERSION
  gem.summary       = %q{ec2 instance tag apply environment variables.}
  gem.description   = %q{ec2 instance tag apply environment variables.}
  gem.license       = "MIT"
  gem.authors       = ["toyama0919"]
  gem.email         = "toyama0919@gmail.com"
  gem.homepage      = "https://github.com/toyama0919/tagenv"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_dependency 'thor'
  gem.add_dependency 'aws-sdk', '~> 2'

  gem.add_development_dependency 'bundler'
  gem.add_development_dependency 'pry', '~> 0.10.1'
  gem.add_development_dependency 'rake', '~> 10.3.2'
  gem.add_development_dependency 'rspec', '~> 3.0'
  gem.add_development_dependency 'rubocop', '~> 0.24.1'
  gem.add_development_dependency 'rubygems-tasks', '~> 0.2'
  gem.add_development_dependency 'yard', '~> 0.8'
end
