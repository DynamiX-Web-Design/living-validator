# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'living-validator/version'

Gem::Specification.new do |gem|
  gem.name          = "living-validator"
  gem.version       = LivingValidator::VERSION
  gem.authors       = ["Whit Marbut"]
  gem.email         = ["wmarbut@dynamixwebdesign.com"]
  gem.license		= "Creative Commons Attribution-ShareAlike 3.0 Unported"
  gem.description   = %q{A simple suite for querying the validator.nu service (or your own instance).}
  gem.summary       = %q{A simple suite for querying the validator.nu service (or your own instance).}
  gem.homepage      = "https://bitbucket.org/dynamixwd/living-validator"

  gem.files         = `git ls-files`.split($/)
  #gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  #gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'httparty', '>= 0.9.0'
  gem.add_dependency 'json', '1.7.5'
end
