# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'css_canon/version'

Gem::Specification.new do |gem|
  gem.name          = "css_canon"
  gem.version       = CssCanon::VERSION
  gem.authors       = ["Michael Johnston"]
  gem.email         = ["lastobelus@mac.com"]
  gem.description   = %q{Imposes a "canonical" css/sass/SMACSS structure on a Rails 3.x project.}
  gem.summary       = %q{Imposes a "canonical" css/sass/SMACSS structure on a Rails 3.x project.}
  gem.homepage      = "https://github.com/lastobelus/css_canon"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency  "compass"
  gem.add_dependency  "zurb-foundation", ">= 4.0"

end
