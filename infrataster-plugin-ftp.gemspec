# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "infrataster/plugin/ftp/version"

Gem::Specification.new do |spec|
  spec.name          = "infrataster-plugin-ftp"
  spec.version       = Infrataster::Plugin::Ftp::VERSION
  spec.authors       = ["Yohei Kawahara"]
  spec.email         = ["inokara@gmail.com"]

  spec.summary       = %q{FTP Plugin for Infrataster.}
  spec.description   = %q{FTP Plugin for Infrataster.}
  spec.homepage      = "https://github.com/inokappa/infrataster-plugin-ftp"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'infrataster'

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
