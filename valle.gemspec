# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.authors       = ["Anton Kalyaev"]
  gem.email         = ["anton.kalyaev@gmail.com"]
  gem.description   = %q{Valle automatically sets minimum and maximum values for the fields of your ActiveRecord model(s), so you shouldn't worry, that string length or ID value will exceed the permissible limit.}
  gem.summary       = %q{Built-in limit validations for your ActiveRecord model.}
  gem.homepage      = "http://github.com/kaize/valle"
  gem.license       = "MIT"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "valle"
  gem.require_paths = ["lib"]
  gem.version       = "1.1.1"

  gem.add_dependency 'activerecord', '>= 3.0'
  gem.add_dependency 'activesupport'
end
