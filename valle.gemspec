# -*- encoding: utf-8 -*-
require File.expand_path('../lib/valle/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Anton Kalyaev"]
  gem.email         = ["anton.kalyaev@gmail.com"]
  gem.description   = %q{Valle adds validators to all the fields of your ActiveRecord models, so you should not think that string length or ID value exceeds the permissible limits}
  gem.summary       = %q{Set automatically the minimum and maximum values for your ActiveRecord model fields}
  gem.homepage      = "http://github.com/kaize/valle"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "valle"
  gem.require_paths = ["lib"]
  gem.version       = Valle::VERSION

  gem.add_runtime_dependency 'activerecord'
  gem.add_runtime_dependency 'activesupport'
end
